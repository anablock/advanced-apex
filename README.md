# Salesforce App

This guide helps Salesforce developers who are new to Visual Studio Code go from zero to a deployed app using Salesforce Extensions for VS Code and Salesforce CLI.

## Part 1: Choosing a Development Model

There are two types of developer processes or models supported in Salesforce Extensions for VS Code and Salesforce CLI. These models are explained below. Each model offers pros and cons and is fully supported.

### Package Development Model

The package development model allows you to create self-contained applications or libraries that are deployed to your org as a single package. These packages are typically developed against source-tracked orgs called scratch orgs. This development model is geared toward a more modern type of software development process that uses org source tracking, source control, and continuous integration and deployment.

If you are starting a new project, we recommend that you consider the package development model. To start developing with this model in Visual Studio Code, see [Package Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/package-development-model). For details about the model, see the [Package Development Model](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_dev_model) Trailhead module.

If you are developing against scratch orgs, use the command `SFDX: Create Project` (VS Code) or `sfdx force:project:create` (Salesforce CLI)  to create your project. If you used another command, you might want to start over with that command.

When working with source-tracked orgs, use the commands `SFDX: Push Source to Org` (VS Code) or `sfdx force:source:push` (Salesforce CLI) and `SFDX: Pull Source from Org` (VS Code) or `sfdx force:source:pull` (Salesforce CLI). Do not use the `Retrieve` and `Deploy` commands with scratch orgs.

### Org Development Model

The org development model allows you to connect directly to a non-source-tracked org (sandbox, Developer Edition (DE) org, Trailhead Playground, or even a production org) to retrieve and deploy code directly. This model is similar to the type of development you have done in the past using tools such as Force.com IDE or MavensMate.

To start developing with this model in Visual Studio Code, see [Org Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/org-development-model). For details about the model, see the [Org Development Model](https://trailhead.salesforce.com/content/learn/modules/org-development-model) Trailhead module.

If you are developing against non-source-tracked orgs, use the command `SFDX: Create Project with Manifest` (VS Code) or `sfdx force:project:create --manifest` (Salesforce CLI) to create your project. If you used another command, you might want to start over with this command to create a Salesforce DX project.

When working with non-source-tracked orgs, use the commands `SFDX: Deploy Source to Org` (VS Code) or `sfdx force:source:deploy` (Salesforce CLI) and `SFDX: Retrieve Source from Org` (VS Code) or `sfdx force:source:retrieve` (Salesforce CLI). The `Push` and `Pull` commands work only on orgs with source tracking (scratch orgs).

## The `sfdx-project.json` File

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

The most important parts of this file for getting started are the `sfdcLoginUrl` and `packageDirectories` properties.

The `sfdcLoginUrl` specifies the default login URL to use when authorizing an org.

The `packageDirectories` filepath tells VS Code and Salesforce CLI where the metadata files for your project are stored. You need at least one package directory set in your file. The default setting is shown below. If you set the value of the `packageDirectories` property called `path` to `force-app`, by default your metadata goes in the `force-app` directory. If you want to change that directory to something like `src`, simply change the `path` value and make sure the directory you’re pointing to exists.

```json
"packageDirectories" : [
    {
      "path": "force-app",
      "default": true
    }
]
```

## Part 2: Working with Source

For details about developing against scratch orgs, see the [Package Development Model](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_dev_model) module on Trailhead or [Package Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/package-development-model).

For details about developing against orgs that don’t have source tracking, see the [Org Development Model](https://trailhead.salesforce.com/content/learn/modules/org-development-model) module on Trailhead or [Org Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/org-development-model).

## Part 3: Deploying to Production

Don’t deploy your code to production directly from Visual Studio Code. The deploy and retrieve commands do not support transactional operations, which means that a deployment can fail in a partial state. Also, the deploy and retrieve commands don’t run the tests needed for production deployments. The push and pull commands are disabled for orgs that don’t have source tracking, including production orgs.

Deploy your changes to production using [packaging](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_dev2gp.htm) or by [converting your source](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_source.htm#cli_reference_convert) into metadata format and using the [metadata deploy command](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_force_mdapi.htm#cli_reference_deploy).

# sfdx Commands
* https://www.youtube.com/watch?time_continue=304&v=MSOH9miurcM&feature=emb_logo
* sfdx force:project:create -n geolocation
* sfdx force:org:create -s -f config/project-scratch-def.json -a GeoAppScratch
* sfdx force:data:record:create -s Account -v "Name='Marriott Marquis' BillingStreet='780 Mission St' BillingCity='San Francisco' BillingState='CA' BillingPostalCode='94103' Phone='(415) 896-1600' Website='www.marriott.com'"
sfdx force:data:tree:export -q "SELECT Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, Phone, Website FROM Account WHERE BillingStreet != NULL AND BillingCity != NULL and BillingState != NULL" -d ./data
* sfdx force:data:tree:import --sobjecttreefiles data/Account.json
* sfdx force:apex:class:create -n AccountSearchController -d force-app/main/default/classes
* sfdx force:source:push
* sfdx force:lightning:event:create -n AccountsLoaded -d force-app/main/default/aura
* sfdx force:org:open
* sfdx force:source:pull

* Successfully created scratch org: 00D1h00000071fgEAA, username: test-hshabt2j72ev@example.com

* sfdx force:org:display -u AdvancedApex
* sfdx force:auth:web:login -a MyTP
* sfdx force:org:list
* history
* 

## Convert Source to Metadata Format and Deploy
Create a folder to put the converted files called mdapioutput.
* mkdir mdapioutput
run the convert command:
* sfdx force:source:convert -d mdapioutput/
Deploy it to your testing environment:
* sfdx force:mdapi:deploy -d mdapioutput/ -u MyTP -w 100
Assign a permission set:
* sfdx force:user:permset:assign -n DreamInvest -u MyTP
Run your tests and interact with the app:
* sfdx force:org:open -u MyTP
* touch

# +++ PLATFORM DEVELOPER I +++
* A roll-up summary field is a field on a mater record that summarizes date or numerical data from detail records.
* The Salesforce platform tracks dependencies between sObjects used in Apex and declarative object definitions.
* Apex initializes all variables, regardless of type, to the special value null.
* Constants are declared using the static + final modifiers.
* Apex primitive data types:
  * Blob
  * Boolean
  * Datetime
  * Decimal
  * Double
  * ID
  * Integer
  * Long
  * String
  * Time
    * Variables to be declared from these data types are all objects.
  ```java
  // Sample String method
  Boolean validString userString.isAlphanumeric();

  // Sample Datetime method
  Date curUserDate = curUserDate.date();

  // Sample constant
  static final DOUBLE PI = 3.142857;

  // A For Loop (list or set iteration)
  for (Integer i :threeNumbers) {
    System.debug('List Loop Iteration: ' + i);
  }
  ```

  * List - ordered, indexed collection of elements
  * Set - unordered collection of elements that does not contain duplicates
  * Map - collection of key value pairs where each unique key maps to a single value

* `with sharing` - which records can the class see
* `DataType memberVariable` - a class can contain 0+ member variables
* `DataType memberProperty { get; set; }` - a class can contain 0+ properties
* `public MyClass() {//... constructor logic}` - a class can contain 0+ constructors
* `public void memberMethod() {}` - a class can contain 0+ methods.

### Accessing an Apex Class or Class Member
| Access Modifier Keyword | Applied to a Class | Applied to a Class Member |
| --- | --- | --- |
| global | Accessible to all code everywhere, used to define code for asynchronous Apex and services (email, web) | Accessible to all code everywhere |
| public | Accessible within your app or namespace | Accessible within your app or namespace |
| protected | Not available | Accessible to any: Inner classes in the defining Apex class, Classes that extend the defining Apex class | 
| private | Applied to inner class to make them accessible locally. Can be applied to test classes. | The default access modifier.  A private member is accessible only within the Apex class in which it is defined. |

### Sharing Model
| When a class is invoked by ... | The Sharing Model is ... |
| An anonymous block | Respected |
| A trigger | Ignored |
| Another class | Respected, if the invoking class is 'with sharing', Ignored otherwise. |

## Triggers
Apex code that may execute because a DML event (insert, update, delete, or undelete) has occured on an sObject.

Once the platform receives a request to perform a DML action, the platform executes the many steps of the 'Save Order of Execution.'  Two of these steps execute triggers.

* before - triggers used to update record values
* after - triggers are used to access field values, such as Ids, that are set by the system and to effect changes in other records.