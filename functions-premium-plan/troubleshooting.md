# Troubleshooting Elastic Premium Plan Functions 
Thank you for participating in the Elastic Premium preview! All of the frequently hit bugs will be catologued here.

## CLI Command Debugging

All of the commands support the `--debug` paramater, which gives you much more information. Please include the debug output with any github issues or emails.

## Creating a premium plan fails with "invalid status code: Conflict"

**Command:** `az functionapp plan create ***`

**Error:** `Operation returned an invalid status code 'Conflict'`

If you run the command with the `--debug` flag, you should see a verbose message that includes the text `"Code":"Conflict","Message":"The pricing tier 'ElasticPremium' is not allowed in this resource group.`

**Solution:** You will need to create your elastic premium plan in a brand new, **empty** resource group in South Central US. This is due to a quirk in our rollout where premium v2 app service plans are only allowed in one subset of machines within South Central US. If you are creating an app service plan in a resource group with existing resources, the platform will try to keep your resources close together, and might attempt to make a premium plan on a set of machines without support of the premium plan.

## Creating a premium plan fails with "invalid status code: Bad Request"

**Command:** `az functionapp plan create ***`

**Error:** `Operation returned an invalid status code 'Bad Request'`

If you run the command with the `--debug` flag, you should see a verbose message that includes the text `"Code":"BadRequest","Message":"ElasticPremium pricing tier is not enabled for this subscription."`

**Solution:** Your current subscription is not enrolled in the Elastic Premium preview. If you have [applied to the preview](http://aka.ms/functionspremium) you will need to wait to receive a welcome email before creating a plan. If you have received a welcome email, check to make sure you are selecting the correct subscription with 'az account show'. 
