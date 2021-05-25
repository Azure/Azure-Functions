---
name: "Functions v4 Breaking Change Proposal"
about: Required template for proposing a breaking change in Functions v4. See https://github.com/Azure/Azure-Functions/discussions/1909 for details.

---

Change description. Describe the change in a few sentences.

### Motivation
What is the motivation for the change?

### Impact
How many customers (roughly) would be impacted by this break? If not known, how can we figure it out? This may require host changes to gather metrics.

### Compat-mode support
We'd like to enable compat-mode support for every breaking change. This may not be feasible in reality, but each proposal should include a plan to switch back to the previous behavior with a feature flag. This requirement will be evaluated on a case-by-case basis.

### Alternatives
Were any alternatives discussed? Is there any way to do this without a break?

### Detection
Can we detect that a customer is using this when they upgrade from v3? Is there a specific error that can be thrown with a link to migration guidance?

### Support
Will there be any incidents-per-day impact? Who will be the support contact? Does support need to be notified of this change? (SPOT)

### Documentation
Documentation impact

### Components impacted
What components does this change impact? Examples of areas (this list may not be exhaustive):
	- Host
	- Tooling (VS, VS Code, CLI)
	- Portal UX
	- Azure CLI

### Performance
Does the change have any performance impact? There may need to be some implementation complete before this can be measured.
