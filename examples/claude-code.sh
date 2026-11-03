#!/bin/sh
# Adds the Gloriads MCP server to Claude Code. Create a key first in Gloriads:
# Settings → API → Create a key, then put it in place of YOUR_API_KEY.
# Add --scope user to use it in every project.
claude mcp add --transport http gloriads https://gloriads.com/api/mcp \
  --header "Authorization: Bearer YOUR_API_KEY"
