<cfparam name="attributes.name">
<cfparam name="attributes.prefixes" default="#structNew()#">

<!--- N-TRIPLE, TURTLE, RDF/XML, RDF/XML-ABBREV, JSON-LD, HTML --->
<cfparam name="attributes.format" default="TURTLE">

<cfparam name="attributes.base" default="">

<cfif attributes.format eq "RDFa" and not isDefined("attributes.base")>
	<cfthrow message="RDFa must be accompanied by a base uri">
</cfif>

<cfif thistag.ExecutionMode eq "start">

	<!--- turn off cfsetting --->
	<cfsavecontent variable="test">HELLO WORLD</cfsavecontent>
	<cfif not len(trim(test))>
		<cfset request.enablecfoutputonly = true>
		<cfsetting enablecfoutputonly="false">
	<cfelse>
		<cfset request.enablecfoutputonly = false>
	</cfif>
	
</cfif>

<cfif thistag.ExecutionMode eq "end">
	<cfset attributes.model = createObject("component", "Model").init(attributes.prefixes)>
	<cfif attributes.format eq "RDFa">
		<cfset attributes.model.addRdfa(trim(thistag.generatedContent), attributes.base)>
	<cfelse>
		<cfset attributes.model.add(trim(thistag.generatedContent))>
	</cfif>
	<cfset setVariable("caller.#attributes.name#", attributes.model) >
</cfif>