# Gloriads MCP server — Amazon Ads for AI assistants

[Gloriads](https://gloriads.com) is an Amazon Ads automation platform that creates, monitors and optimizes Sponsored Products, Sponsored Brands, Sponsored Display and Streaming TV campaigns for sellers, brands, authors and agencies, by rules you control.

Its **remote MCP server** lets an AI assistant (claude.ai, Claude Desktop, ChatGPT, Claude Code, Cursor, VS Code or any MCP client) **read** your Amazon Ads account: results per marketplace and ad type, campaigns, ad groups, keywords and targets, ads, rules and their runs, and every change Gloriads made.

| | |
| --- | --- |
| Endpoint | `https://gloriads.com/api/mcp` |
| Transport | Streamable HTTP |
| Official MCP Registry | `com.gloriads/amazon-ads` |
| Access | **Read-only**: the server can change nothing in your account or at Amazon |
| Sign-in | OAuth (claude.ai, ChatGPT) or an API key in `Authorization: Bearer <key>` |
| Price | Included in every Gloriads plan and in the free trial |

Full guide: https://gloriads.com/docs/api/connect-an-ai-assistant

## What you can ask

- "How did my ads do last month, and in which marketplace did I spend the most?"
- "Is my ACOS better than the month before?"
- "Which products had the worst ACOS over the last 30 days?"
- "Show my spend day by day this month."
- "List my paused campaigns in Germany."
- "Which keywords does this campaign target?"
- "What did my rules change this week, bid by bid?"

## Connect it

### claude.ai and Claude Desktop

Customize → Connectors → Add → **Add custom connector**: name `Gloriads`, URL `https://gloriads.com/api/mcp`, then **Connect**, sign in to Gloriads and click **Allow**. No key to copy.

### ChatGPT (paid plans, developer mode)

Settings → turn on developer mode → Plugins → **New plugin**: name `Gloriads`, Server URL `https://gloriads.com/api/mcp`, Authentication **OAuth**, then sign in to Gloriads and click **Allow**.

### Claude Code

Create a key in Gloriads (Settings → API → Create a key), then:

```bash
claude mcp add --transport http gloriads https://gloriads.com/api/mcp \
  --header "Authorization: Bearer YOUR_API_KEY"
```

### Cursor

Put your key in the `GLORIADS_API_KEY` environment variable, then use [`examples/cursor-mcp.json`](examples/cursor-mcp.json) as `~/.cursor/mcp.json` (all projects) or `.cursor/mcp.json` (one project).

### VS Code

Use [`examples/vscode-mcp.json`](examples/vscode-mcp.json) as your user MCP configuration or `.vscode/mcp.json`. VS Code asks for the key once and remembers it.

## Tools

| Tool | Reads |
| --- | --- |
| `get_account` | Your subscription, whether Amazon Ads is connected, up to which day the figures go |
| `list_marketplaces` | Your connected marketplaces and how many campaigns each runs |
| `get_summary` | The totals of a period, per marketplace and per ad type, compared with an earlier period if you ask |
| `get_timeline` | The same figures day by day or month by month |
| `get_products_report` | Each product's figures over a period |
| `get_streaming_tv_report` | One marketplace's Streaming TV campaigns and their figures |
| `list_campaigns` | One marketplace's campaigns |
| `list_ad_groups` | One marketplace's ad groups |
| `list_targets` | One campaign's keywords and other targets |
| `list_ads` | One campaign's ads |
| `list_rules` | Your rules |
| `list_rule_runs` | One rule's last runs |
| `list_activity` | Everything Gloriads did on Amazon |
| `get_activity` | One operation |
| `list_activity_lines` | What one operation changed, line by line |

## Try it without an account

The public demo key printed on the [API reference](https://gloriads.com/api-reference) works here too. It reads only the demo account's synthetic figures, at 10 requests per minute.

## Limits

60 requests per minute and 10,000 per day per Gloriads account, shared with the REST API (`https://gloriads.com/api/v1`). Errors: https://gloriads.com/docs/api/errors

## Links

- Website: https://gloriads.com
- Pricing: https://gloriads.com/pricing
- API reference: https://gloriads.com/api-reference
- Glama: https://glama.ai/mcp/connectors/com.gloriads/amazon-ads
- Contact: https://gloriads.com/contact

This repository holds the server's public description and connection examples. The server itself is hosted by Gloriads; there is nothing to install.

© GLORIADS LLC. Gloriads is an independent product, not affiliated with Amazon.
