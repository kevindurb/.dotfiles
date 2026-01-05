# Firefox DevTools - Complete Tool Reference

## Page Management

### list_pages
List all open tabs with index, title, and URL. Currently selected tab is marked.
```
list_pages()
```

### new_page
Open a new tab and navigate to URL. Returns new tab index.
```
new_page(url="https://example.com")
```

### navigate_page
Navigate the currently selected tab to URL.
```
navigate_page(url="https://example.com")
```

### select_page
Select active tab by index (preferred), URL, or title. Index takes precedence.
```
select_page(pageIdx=1)
select_page(url="example.com")  # partial match
select_page(title="Google")     # partial match
```

### close_page
Close tab at given index.
```
close_page(pageIdx=2)
```

### navigate_history
Navigate back or forward in history. UIDs become stale after navigation!
```
navigate_history(direction="back")
navigate_history(direction="forward")
```

### set_viewport_size
Set browser viewport size in pixels.
```
set_viewport_size(width=1920, height=1080)
```

## Console Monitoring

### list_console_messages
List console messages since last navigation. Use filters to focus on relevant logs.

**Parameters**:
- `level`: "debug" | "info" | "warn" | "error"
- `limit`: max messages (default 50)
- `sinceMs`: only messages from last N milliseconds
- `textContains`: filter by content (case-insensitive)
- `source`: filter by source type
- `format`: "text" (default) | "json"

```
list_console_messages(level="error", sinceMs=5000)
list_console_messages(textContains="api", limit=20)
```

### clear_console_messages
Clear collected console messages. Use before measurement for focused output.
```
clear_console_messages()
```

## Network Inspection

### list_network_requests
List recent network requests across all tabs. Network capture is always on.

**Parameters**:
- `limit`: max requests (default 50)
- `sinceMs`: only requests from last N milliseconds
- `urlContains`: filter by URL substring (case-insensitive)
- `method`: filter by HTTP method (GET, POST, etc.)
- `status`: filter by exact HTTP status code
- `statusMin`, `statusMax`: filter by status range
- `resourceType`: filter by resource type (script, xhr, image, etc.)
- `isXHR`: true for XHR/fetch requests only
- `sortBy`: "timestamp" | "duration" | "status" (default: timestamp desc)
- `detail`: "summary" (default) | "min" (compact) | "full" (includes headers)
- `format`: "text" (default) | "json"

```
list_network_requests(limit=20, sinceMs=10000)
list_network_requests(isXHR=true, statusMin=400)
list_network_requests(urlContains="api", sortBy="duration")
```

### get_network_request
Get detailed information about a network request by ID (recommended) or URL.

**Parameters**:
- `id`: request ID from list_network_requests (recommended)
- `url`: URL of request (fallback, may match multiple)
- `format`: "text" (default) | "json"

```
get_network_request(id="47-abc123...")
get_network_request(url="https://api.example.com/users")
```

## Page Inspection

### take_snapshot
Capture textual page snapshot with stable UIDs. Always take fresh snapshot after navigation or DOM changes!

**Parameters**:
- `maxLines`: max lines of output (default 100)
- `includeText`: include text content (default true)
- `includeAttributes`: detailed ARIA/attributes (default false)
- `maxDepth`: max tree depth (default unlimited)

```
take_snapshot(maxLines=50)
take_snapshot(includeAttributes=true, maxDepth=5)
```

### resolve_uid_to_selector
Resolve UID to CSS selector (debugging aid). Fails on stale UIDs.
```
resolve_uid_to_selector(uid="2_10")
```

### clear_snapshot
Clear snapshot/UID cache. Usually not needed - navigation auto-invalidates.
```
clear_snapshot()
```

## Element Interaction

### click_by_uid
Click element by UID. Supports double-click. Take fresh snapshot if UID is stale.

**Parameters**:
- `uid`: element UID from snapshot (required)
- `dblClick`: true for double-click (default false)

```
click_by_uid(uid="2_10")
click_by_uid(uid="3_5", dblClick=true)
```

### hover_by_uid
Hover over element by UID.
```
hover_by_uid(uid="2_15")
```

### fill_by_uid
Fill text input or textarea by UID. Keep values short and safe.
```
fill_by_uid(uid="2_8", value="test@example.com")
```

### fill_form_by_uid
Fill multiple form fields in one call.
```
fill_form_by_uid(elements=[
  {uid: "2_8", value: "user@example.com"},
  {uid: "2_10", value: "password123"}
])
```

### drag_by_uid_to_uid
Simulate HTML5 drag-and-drop using JS drag events. May not work with all custom libraries.
```
drag_by_uid_to_uid(fromUid="2_5", toUid="2_20")
```

### upload_file_by_uid
Upload file to `<input type="file">` element. File path must be accessible.
```
upload_file_by_uid(uid="2_12", filePath="/path/to/file.pdf")
```

## Visual Capture

### screenshot_page
Capture PNG screenshot of current page. Returns base64 string (no data: prefix).
```
screenshot_page()
```

### screenshot_by_uid
Capture PNG screenshot of specific element. Returns base64 string.
```
screenshot_by_uid(uid="2_10")
```

## Dialog Handling

### accept_dialog
Accept active browser dialog (alert/confirm/prompt). For prompts, provide promptText.
```
accept_dialog()
accept_dialog(promptText="my input")
```

### dismiss_dialog
Dismiss active browser dialog.
```
dismiss_dialog()
```

## Quick Reference by Use Case

### "Find failed requests"
```
list_network_requests(statusMin=400, limit=20)
```

### "Check recent errors"
```
list_console_messages(level="error", sinceMs=5000)
```

### "See slow requests"
```
list_network_requests(sortBy="duration", limit=10)
```

### "Find API calls"
```
list_network_requests(isXHR=true, urlContains="api")
```

### "Interact with form"
```
take_snapshot()
fill_form_by_uid(elements=[...])
click_by_uid("submit_uid")
```

### "Debug after click"
```
click_by_uid("button_uid")
take_snapshot()  # Fresh snapshot!
list_console_messages(sinceMs=2000)
list_network_requests(sinceMs=2000)
```
