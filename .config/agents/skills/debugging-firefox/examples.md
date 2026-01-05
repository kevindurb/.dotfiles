# Firefox DevTools - Practical Examples

Real-world debugging scenarios with complete workflows.

## Example 1: Debug API Call Failure

**Scenario**: User reports "data not loading" on a page.

```
# Step 1: Check for failed requests
list_network_requests(isXHR=true, statusMin=400, limit=20)

# Output shows:
# 123-abc | GET https://api.example.com/users [401]

# Step 2: Get full details
get_network_request(id="123-abc")

# Output shows missing Authorization header

# Step 3: Check console for related errors
list_console_messages(level="error", sinceMs=10000)

# Result: Found 401 Unauthorized - missing auth token
```

## Example 2: Debug Form Submission

**Scenario**: Contact form submits but doesn't show success message.

```
# Step 1: Get page structure
take_snapshot(maxLines=50)

# Step 2: Fill form
fill_form_by_uid(elements=[
  {uid: "3_8", value: "John Doe"},
  {uid: "3_10", value: "john@example.com"},
  {uid: "3_12", value: "Test message"}
])

# Step 3: Clear logs before submit
clear_console_messages()

# Step 4: Submit form
click_by_uid("3_15")  # Submit button

# Step 5: Check what happened
take_snapshot()  # Get new state
list_console_messages(sinceMs=2000)
list_network_requests(method="POST", sinceMs=2000)

# Result: Found 500 error in POST request
get_network_request(id="...")  # Get error details
```

## Example 3: Performance Investigation

**Scenario**: Page loads slowly.

```
# Step 1: Clear network history
navigate_page(url="https://example.com")

# Step 2: Wait for load, then check slowest requests
list_network_requests(sortBy="duration", limit=10, detail="summary")

# Output shows:
# 45-xyz | GET /large-image.jpg [200] 3250ms
# 46-xyz | GET /api/data [200] 1890ms

# Step 3: Get timing details
get_network_request(id="45-xyz")

# Result: 3.2s for 5MB unoptimized image
```

## Example 4: JavaScript Error Hunt

**Scenario**: Button click does nothing.

```
# Step 1: Get page structure
take_snapshot()

# Step 2: Clear console
clear_console_messages()

# Step 3: Click button
click_by_uid("2_18")

# Step 4: Check for errors
list_console_messages(level="error")

# Output shows:
# TypeError: Cannot read property 'value' of null
# at handleClick (app.js:42)

# Result: JS error preventing form submission
```

## Example 5: Multi-Tab Comparison

**Scenario**: Feature works in one environment but not another.

```
# Step 1: List current tabs
list_pages()

# Step 2: Open staging environment
new_page(url="https://staging.example.com")

# Step 3: Test in staging
take_snapshot()
click_by_uid("...")
list_network_requests(isXHR=true, sinceMs=5000)

# Step 4: Switch to production
select_page(pageIdx=0)

# Step 5: Test in production
take_snapshot()
click_by_uid("...")
list_network_requests(isXHR=true, sinceMs=5000)

# Result: Compare network requests between environments
```

## Example 6: CORS Debugging

**Scenario**: API calls fail with CORS errors.

```
# Step 1: Check for failed requests
list_network_requests(statusMin=400, limit=20)

# Step 2: Get full headers
get_network_request(id="...", format="text")

# Check response headers for:
# - Access-Control-Allow-Origin
# - Access-Control-Allow-Methods
# - Access-Control-Allow-Headers

# Step 3: Check console for CORS messages
list_console_messages(textContains="CORS")

# Result: Missing CORS headers on API response
```

## Example 7: Login Flow Testing

**Scenario**: Test complete login flow.

```
# Step 1: Navigate to login page
navigate_page(url="https://example.com/login")

# Step 2: Get form structure
take_snapshot(maxLines=50)

# Step 3: Fill login form
fill_form_by_uid(elements=[
  {uid: "2_5", value: "testuser@example.com"},
  {uid: "2_7", value: "password123"}
])

# Step 4: Clear before submit
clear_console_messages()

# Step 5: Submit
click_by_uid("2_9")

# Step 6: Wait for redirect, then check
take_snapshot()

# Step 7: Verify login request
list_network_requests(urlContains="login", method="POST")
get_network_request(id="...")

# Step 8: Check for auth token in response
list_network_requests(urlContains="token")

# Result: Verify 200 response and token received
```

## Example 8: Infinite Scroll Investigation

**Scenario**: Infinite scroll stops loading after a few pages.

```
# Step 1: Get initial state
take_snapshot(maxLines=30)

# Step 2: Scroll to trigger load
# (Find scroll container UID)
click_by_uid("scroll_container_uid")

# Step 3: Monitor network requests
list_network_requests(urlContains="api/items", sortBy="timestamp")

# Step 4: Check for errors after multiple scrolls
list_console_messages(level="error", sinceMs=30000)
list_network_requests(statusMin=400, urlContains="api/items")

# Result: Found 429 Rate Limit error after 5 requests
```

## Example 9: Dialog Interaction

**Scenario**: Test behavior of confirm dialog.

```
# Step 1: Trigger action that shows dialog
take_snapshot()
click_by_uid("delete_button_uid")

# Step 2: Accept dialog
accept_dialog()

# Step 3: Check result
take_snapshot()
list_network_requests(method="DELETE", sinceMs=2000)

# Alternative: Dismiss dialog
# dismiss_dialog()
```

## Example 10: Visual Regression Check

**Scenario**: Verify element renders correctly.

```
# Step 1: Navigate to page
navigate_page(url="https://example.com")

# Step 2: Get structure
take_snapshot()

# Step 3: Screenshot specific element
screenshot_by_uid("2_15")

# Step 4: Compare with expected state
# (Base64 image returned for analysis)

# Alternative: Full page screenshot
screenshot_page()
```

## Tips from Real Debugging Sessions

### Tip 1: Always Clear Before Measuring
```
# Bad
list_console_messages()  # Shows old messages too

# Good
clear_console_messages()
# ... trigger action ...
list_console_messages(sinceMs=5000)
```

### Tip 2: Use Time Filters for Precision
```
# Bad - too much noise
list_network_requests(limit=100)

# Good - focused on recent activity
list_network_requests(sinceMs=10000, limit=20)
```

### Tip 3: Snapshot After Every Navigation
```
# Bad
click_by_uid("2_10")  # Navigates to new page
click_by_uid("3_5")   # ERROR: Stale UID!

# Good
click_by_uid("2_10")
take_snapshot()       # Fresh UIDs
click_by_uid("3_5")   # Works!
```

### Tip 4: Start Broad, Then Narrow
```
# Step 1: Overview
list_network_requests(statusMin=400)

# Step 2: Details
get_network_request(id="specific-request-id")
```

### Tip 5: Check Both Console and Network
```
# After any interaction
list_console_messages(level="error", sinceMs=2000)
list_network_requests(statusMin=400, sinceMs=2000)

# Errors can appear in either place!
```
