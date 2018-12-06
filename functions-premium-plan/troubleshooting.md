# Troubleshooting Premium Functions 
Thank you for participating in the premium preview! All of the frequently hit bugs will be catologued here.

## Creating a premium plan fails with "invalid status code: Conflict"

**Command:** `az functionapp plan create ***`

**Error:** `Operation returned an invalid status code 'Conflict'`

If you run the command with the `--debug` flag, you should see a verbose message that includes the text `"Code":"Conflict","Message":"The pricing tier 'ElasticPremium' is not allowed in this resource group.`

**Solution:** You will need to create your premium plan in a brand new, **empty** resource group in South Central US. This is due to a quirk in our rollout where premium app service plans are only allowed in one subset of machines within South Central US. If you are creating an app service plan in a resource group with existing resources, the platform will try to keep your resources close together, and might attempt to make a premium plan on a set of machines without support of the premium plan.

## CLI Command Debugging

All of the commands support the `--debug` paramater, which gives you much more information. Please include the debug output with any github issues or emails.
