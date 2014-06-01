<cfcomponent displayname="cfsemantictest" extends="mxunit.framework.TestCase">
	<cffunction name="testThatIAmReadyForThisWorkshop" access="public" returntype="void">
		<cfscript>
			prefixes = structNew();
			prefixes["test"] = "http://test.com/";
		</cfscript>

		<cf_rdf name="test" prefixes="#prefixes#">
			test:one test:two test:three.
		</cf_rdf>

		<cfset assertTrue(test.ask("test:one test:two test:three"))>
	</cffunction>
</cfcomponent>