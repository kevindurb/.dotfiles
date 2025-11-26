# Cross-platform function to copy a file to the clipboard for pasting into GUIs.
fcopy() {
  # Ensure a file path is provided
  if [ -z "$1" ]; then
    echo "Usage: fcopy <file>" >&2
    return 1
  fi

  # Ensure the file exists
  if [ ! -e "$1" ]; then
    echo "Error: File not found at '$1'" >&2
    return 1
  fi

  # Get the full, absolute path of the file
  local full_path
  full_path="$(realpath "$1")"

  case "$(uname -s)" in
    # macOS
    Darwin)
      osascript -e "set the clipboard to POSIX file \"$full_path\""
      echo "Copied '$1' to clipboard for macOS."
      ;;

    # Linux
    Linux)
      # Wayland session
      if [ -n "$WAYLAND_DISPLAY" ]; then
        if command -v wl-copy &> /dev/null; then
          wl-copy "file://$full_path"
          echo "Copied '$1' to clipboard for Wayland."
        else
          echo "Error: wl-copy not found. Please install wl-clipboard." >&2
          return 1
        fi
      # X11 session
      elif [ -n "$DISPLAY" ]; then
        if command -v xclip &> /dev/null; then
          echo -n "file://$full_path" | xclip -selection clipboard -t text/uri-list
          echo "Copied '$1' to clipboard for X11."
        else
          echo "Error: xclip not found. Please install xclip." >&2
          return 1
        fi
      else
        echo "Error: Could not determine a graphical session (X11 or Wayland)." >&2
        return 1
      fi
      ;;

    *)
      echo "Error: Unsupported operating system '$(uname -s)'" >&2
      return 1
      ;;
  esac
}
