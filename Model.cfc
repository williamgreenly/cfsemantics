<cfcomponent output="no" displayname="Model">

    <cfproperty name="prefixes" type="struct" getter="true" setter="true">

	<cffunction name="init" access="public" output="yes" returntype="Model"> 
        <cfargument name="prefixes" type="struct" required="false">
        <cfif structKeyExists(arguments, "prefixes")>
            <cfset variables.prefixes = arguments.prefixes>
        <cfelse>
            <cfset variables.prefixes = structNew()>
        </cfif>
      
		<cfscript>
			variables.model = CreateObject("java", "com.lescot.GroovyRdfModel", "libs/groovy-all-1.8.6.jar,libs/lescot-0.1.jar").init(variables.prefixes);
        </cfscript>
        <cfreturn this>
	</cffunction>

	<cffunction name="OnMissingMethod" access="public" returntype="any" output="no">
        <cfargument name="MissingMethodName" type="string" required="true">
        <cfargument name="MissingMethodArguments" type="struct" required="true">
        <cfif StructIsEmpty(arguments.MissingMethodArguments)>
            <cfreturn evaluate("variables.model.#arguments.MissingMethodName#()")>
        <cfelse>
            <cfset argString = "">
            <cfset cnt = 1>
            <cfset argcount = structCount(arguments.MissingMethodArguments)>
            <cfloop collection="#arguments.MissingMethodArguments#" item="i">
                <cfif cnt eq argcount>
                    <cfset argString = argString & "arguments.MissingMethodArguments[#i#]">
                <cfelse>
                    <cfset argString = argString & "arguments.MissingMethodArguments[#i#],">
                </cfif>
                <cfset cnt= cnt +1>
            </cfloop>
        	<cfreturn evaluate("variables.model.#arguments.MissingMethodName#(#argString#)")>
        </cfif>
    </cffunction>

</cfcomponent>