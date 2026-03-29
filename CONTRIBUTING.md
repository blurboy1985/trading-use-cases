# Contributing to OpenClaw Trading Use Cases

Thank you for your interest in contributing! This catalogue is a community resource to help others discover how OpenClaw can be used for trading and financial automation.

---

## 📋 How to Contribute

### Adding a New Use Case

1. **Fork the repository**

2. **Edit `index.html`** - Find the `useCases` array (around line 400) and add your use case:

```javascript
{
    id: 41,  // Use next available number
    category: "market-monitoring",  // One of the 7 categories
    title: "Your Use Case Title",
    description: "Clear, concise description of what it does",
    tags: ["tag1", "tag2", "tag3"],  // 3-5 relevant tags
    verified: false,  // Set to true only if you're actively running this
    verifiedBy: "@yourusername",  // Your username if verified
    riskLevel: "low",  // low, medium, or high
    implementation: {
        tools: ["browser", "cron", "exec"],  // OpenClaw tools used
        skills: ["Required skill names"],
        complexity: "Medium",  // Low, Medium, or High
        steps: [
            "First step to implement",
            "Second step",
            "Third step",
            // Add as many steps as needed
        ]
    }
}
```

3. **Update the count** - If you're adding to a new category, ensure the category section exists in the HTML

4. **Test locally** - Open `index.html` in your browser and verify:
   - Your use case appears in the correct category
   - Search works for your use case
   - Filter by category works
   - Modal opens with correct details

5. **Submit a Pull Request** with:
   - Clear title: "Add [Use Case Name] use case"
   - Description explaining the use case
   - Your experience level with it (built it, planning to, heard about it)
   - Risk assessment justification

---

## 📝 Contribution Guidelines

### Use Case Quality Standards

**✅ DO:**

- Be specific about implementation steps
- Include realistic complexity assessment
- Accurately assess risk level
- Use clear, jargon-free language
- Test your changes before submitting
- Include relevant tags for searchability

**❌ DON'T:**

- Submit hypothetical ideas without implementation path
- Downplay risks of automated trading
- Include financial advice or recommendations
- Add promotional content or affiliate links
- Submit duplicate use cases

### Risk Level Definitions

| Level | Definition | Examples |
|-------|------------|----------|
| **Low** | Monitoring/analysis only, no automated execution | Price alerts, news aggregation, portfolio tracking |
| **Medium** | Automated alerts that may influence decisions, or simple automated actions | Signal generation, DCA bots, rebalancing alerts |
| **High** | Automated trading execution, derivatives, or complex strategies | Options trading, grid trading, leverage strategies |

### Category Guide

| Category | What Belongs Here |
|----------|-------------------|
| 📊 Market Monitoring | Price tracking, volume alerts, earnings calendars |
| 📈 Technical Analysis | Indicators, patterns, chart analysis, backtesting |
| 📋 Fundamental Analysis | SEC filings, earnings calls, financial ratios |
| 💼 Portfolio Management | Performance tracking, allocation, dividends, tax |
| 📰 News & Sentiment | News aggregation, social sentiment, insider trading |
| 🤖 Automated Trading | Paper trading, broker APIs, DCA, grid trading |
| 📜 Options & Derivatives | Options strategies, Greeks, volatility analysis |

---

## 🔧 Development Setup

### Local Testing

1. Clone your fork:
```bash
git clone https://github.com/your-username/trading-use-cases.git
cd trading-use-cases
```

2. Open `index.html` in your browser:
```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Or drag the file into your browser
```

3. Make your changes and refresh the browser

### No Build Step Required

This is a static single-page application with no build process. All code is in `index.html`.

---

## 🏷️ Tag Guidelines

Use consistent tags for better searchability:

**Common Tags:**
- Assets: `stocks`, `crypto`, `forex`, `options`, `etf`
- Data: `price`, `volume`, `earnings`, `sec`, `filings`
- Analysis: `technical`, `fundamental`, `sentiment`, `patterns`
- Actions: `alerts`, `scanner`, `tracking`, `automation`, `execution`
- Platforms: `tradingview`, `alpaca`, `binance`, `interactive-brokers`
- Strategies: `dca`, `grid`, `wheel`, `arbitrage`, `swing-trading`

---

## 📄 Pull Request Template

When submitting a PR, please include:

```markdown
## Use Case Details

**Title:** [Use Case Name]

**Category:** [Category]

**Description:** [Brief description]

**Implementation Status:**
- [ ] I have built and tested this
- [ ] I am planning to build this
- [ ] I have seen this implemented by others

**Risk Level:** [Low/Medium/High]

**Risk Justification:** [Why this risk level?]

**OpenClaw Tools Used:** [browser, exec, cron, etc.]

**Additional Notes:** [Any other relevant information]

## Checklist

- [ ] My use case follows the contribution guidelines
- [ ] I have tested the changes locally
- [ ] Risk level is accurately assessed
- [ ] Implementation steps are clear and actionable
- [ ] Tags are relevant and consistent
```

---

## 🐛 Reporting Issues

Found a bug or have a suggestion? Open an issue with:

- **Bug reports:** Steps to reproduce, expected vs. actual behavior
- **Feature requests:** Clear description of the feature and use case
- **Corrections:** If you spot inaccurate information

---

## 💡 Ideas for Contributions

Not sure what to contribute? Here are some ideas:

1. **Add missing use cases** you've implemented or seen
2. **Improve implementation steps** for existing use cases
3. **Add screenshots or diagrams** (would require layout changes)
4. **Translate** the site to other languages
5. **Improve accessibility** (ARIA labels, keyboard navigation)
6. **Add export functionality** (PDF, CSV of use cases)
7. **Create video tutorials** for complex use cases

---

## 📞 Questions?

Join the [OpenClaw Discord](https://discord.gg/clawd) and ask in the #showcase or #trading channels.

---

## ⚠️ Reminder

**This catalogue is NOT financial advice.** All contributions should:

- Include appropriate risk warnings
- Not recommend specific trades or strategies
- Not guarantee performance
- Encourage paper trading and testing

Thank you for contributing to the community! 🦞
