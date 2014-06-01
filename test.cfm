<cfinvoke component="mxunit.runner.DirectoryTestSuite"
          method="run"
          directory="~/dev/tmp/cf/"
          recurse="false"
          returnvariable="results" />
 
<cfoutput> #results.getResultsOutput('extjs')# </cfoutput>


