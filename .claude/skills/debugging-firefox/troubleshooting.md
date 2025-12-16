# Firefox DevTools - Troubleshooting Guide

Common issues and solutions when debugging with Firefox DevTools.

## Console Logging Issues

### Problem: Console shows "[Object object]" instead of data

**Cause**: Objects logged without serialization show as `[Object object]` in DevTools.

**Solution**: Always use `JSON.stringify()` when logging objects:

```javascript
// Bad - shows [Object object]
console.log("User data:", userData)

// Good - shows actual object contents
console.log("User data:", JSON.stringify(userData, null, 2))

// Also good - for quick debugging
console.log("User data:", JSON.stringify(userData))
```

**Why this matters**: When you use `list_console_messages()`, you need to see the actual data, not just `[Object object]`. This is especially critical for:
- API responses
- State objects
- Configuration objects
- Error details

**Pro tip**: Add a helper function in your code for consistent logging:
```javascript
function debugLog(label, obj) {
  console.log(`${label}:`, JSON.stringify(obj, null, 2))
}

debugLog("API Response", response)
```

### Problem: Console messages truncated or missing

**Cause**: Too many messages or old messages not cleared.

**Solution**:
```
# Clear before testing
clear_console_messages()

# Then trigger your action

# View recent messages only
list_console_messages(sinceMs=5000, limit=50)
```

### Problem: Can't find the log message you need

**Solution**: Use filters effectively:
```
# Filter by level
list_console_messages(level="error")

# Filter by content
list_console_messages(textContains="api")

# Combine filters
list_console_messages(level="warn", textContains="timeout", sinceMs=10000)
```

## UID and Snapshot Issues

### Problem: "Stale UID" error when clicking

**Cause**: UIDs become invalid after navigation or DOM changes.

**Solution**: ALWAYS take a fresh snapshot after any navigation:
```
# Bad
take_snapshot()
click_by_uid("2_10")  # This navigates
click_by_uid("3_5")   # ERROR: Stale UID!

# Good
take_snapshot()
click_by_uid("2_10")
take_snapshot()       # Fresh snapshot!
click_by_uid("3_5")   # Works!
```

### Problem: Can't find element in snapshot

**Cause**: Element might be hidden, in iframe, or outside maxLines limit.

**Solutions**:
```
# Increase output
take_snapshot(maxLines=200)

# Include more attributes
take_snapshot(includeAttributes=true)

# Remove depth limit
take_snapshot(maxDepth=999)

# Check if element loads dynamically
take_snapshot()  # Before
# ... wait or trigger action ...
take_snapshot()  # After - element might appear now
```

### Problem: UID resolves to wrong element

**Cause**: Multiple similar elements or dynamic content.

**Solution**: Use `resolve_uid_to_selector` to verify:
```
resolve_uid_to_selector(uid="2_10")
# Returns CSS selector - verify it's correct
```

## Network Request Issues

### Problem: Too many requests, can't find the one you need

**Solution**: Use aggressive filtering:
```
# Filter by time (last 5 seconds)
list_network_requests(sinceMs=5000)

# Filter by URL
list_network_requests(urlContains="api/users")

# Filter by status
list_network_requests(statusMin=400, statusMax=499)

# Filter by type
list_network_requests(isXHR=true)

# Combine filters
list_network_requests(
  urlContains="api",
  isXHR=true,
  sinceMs=10000,
  statusMin=400
)
```

### Problem: Request shows [object Object] in headers

**Cause**: Headers object needs formatting in tool output.

**Solution**: Use `get_network_request` for formatted details:
```
# Get full request details
get_network_request(id="123-abc", format="text")

# Or JSON format for parsing
get_network_request(id="123-abc", format="json")
```

### Problem: Can't find slow request

**Solution**: Sort by duration:
```
list_network_requests(sortBy="duration", limit=10)
# Shows slowest requests first

# Then get timing details
get_network_request(id="slowest-request-id")
```

### Problem: Request ID changed or not found

**Cause**: Network history cleared or request too old.

**Solution**: Use URL fallback (but be aware it may match multiple):
```
# Preferred - by ID
get_network_request(id="123-abc")

# Fallback - by URL (may match multiple)
get_network_request(url="api/users")
```

## Page Interaction Issues

### Problem: Click doesn't trigger expected behavior

**Debug steps**:
```
# 1. Verify element is clickable
take_snapshot(includeAttributes=true)
# Check if element has click handlers

# 2. Click and check for errors
click_by_uid("2_10")
list_console_messages(level="error", sinceMs=2000)

# 3. Check network activity
list_network_requests(sinceMs=2000)

# 4. Verify page state changed
take_snapshot()
```

### Problem: Form fill doesn't work

**Possible causes and solutions**:

1. **Wrong element type**:
```
take_snapshot(includeAttributes=true)
# Verify it's actually an input/textarea
```

2. **JavaScript validation prevents it**:
```
fill_by_uid(uid="2_8", value="test")
list_console_messages(level="error")
```

3. **Multiple fields need filling**:
```
# Use fill_form_by_uid for multiple fields
fill_form_by_uid(elements=[
  {uid: "2_8", value: "user@example.com"},
  {uid: "2_10", value: "password"}
])
```

### Problem: Dialog not appearing or can't be handled

**Debug approach**:
```
# Trigger action that should show dialog
click_by_uid("delete_button")

# Try to accept/dismiss
accept_dialog()
# or
dismiss_dialog()

# If error, check console for JavaScript errors
list_console_messages(level="error")

# The dialog might be a custom modal, not a browser dialog
take_snapshot()  # Look for modal in DOM
```

## Tab Management Issues

### Problem: Wrong tab selected

**Solution**: Always list first, then select by index:
```
# List to see indices
list_pages()

# Output:
# [0] Page 1
# [1] Page 2 👉 (current)
# [2] Page 3

# Select by index (most reliable)
select_page(pageIdx=2)

# Or by URL/title (less reliable)
select_page(urlContains="example.com")
```

### Problem: Can't close tab

**Cause**: Invalid index or trying to close last tab.

**Solution**:
```
# Check which tabs exist
list_pages()

# Close by index
close_page(pageIdx=1)

# Firefox may prevent closing last tab
```

## Performance Debugging Issues

### Problem: Can't identify performance bottleneck

**Systematic approach**:
```
# 1. Clear and navigate
navigate_page(url="https://example.com")

# 2. Wait for complete load

# 3. Check slowest requests
list_network_requests(sortBy="duration", limit=10)

# 4. Get timing breakdown
get_network_request(id="slowest-id")

# Look at timing object:
# - requestTime: when request started
# - responseTime: when response received
# - duration: total time
```

### Problem: Timing seems wrong or missing

**Explanation**: Some requests may not have complete timing data:
- Cached requests may show 0ms
- Failed requests may have incomplete timing
- CORS can block timing info

**Solution**: Check multiple requests and status codes:
```
list_network_requests(
  status=200,
  sortBy="duration",
  detail="full"
)
```

## Common Workflow Mistakes

### Mistake 1: Not clearing before measuring

```
# Bad - mixed with old data
list_console_messages()

# Good - focused on current test
clear_console_messages()
# ... trigger action ...
list_console_messages(sinceMs=5000)
```

### Mistake 2: Forgetting to snapshot after navigation

```
# Bad
click_by_uid("2_10")  # Navigates
click_by_uid("3_5")   # FAILS

# Good
click_by_uid("2_10")
take_snapshot()
click_by_uid("3_5")   # Works
```

### Mistake 3: Not using time filters

```
# Bad - thousands of requests
list_network_requests()

# Good - recent activity only
list_network_requests(sinceMs=10000, limit=20)
```

### Mistake 4: Missing console errors while focusing on network

```
# Bad - only check network
list_network_requests(statusMin=400)

# Good - check both
list_console_messages(level="error", sinceMs=5000)
list_network_requests(statusMin=400, sinceMs=5000)
```

### Mistake 5: Not checking error details

```
# Bad - just see it failed
list_network_requests(statusMin=400)

# Good - get full error details
list_network_requests(statusMin=400)
get_network_request(id="failed-request-id")
```

## Quick Diagnostic Checklist

When debugging an issue, run through this checklist:

```
# 1. What's the current state?
list_pages()
take_snapshot(maxLines=50)

# 2. Any console errors?
list_console_messages(level="error", sinceMs=30000)

# 3. Any failed network requests?
list_network_requests(statusMin=400, sinceMs=30000)

# 4. Any slow requests?
list_network_requests(sortBy="duration", limit=5)

# 5. What happened recently?
list_console_messages(sinceMs=10000)
list_network_requests(sinceMs=10000, limit=20)
```

This systematic approach catches 90% of issues.
