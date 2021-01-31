Class cls.Home.HomeREST Extends Home.REST.Base
{

Parameter Version = "1.0.6";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- Server Info -->
<Route Url="/" Method="GET" Call="GetInfo" Cors="true"/>
<!-- Get all records of Person class -->
<Route Url="/images/all" Method="GET" Call="GetAllImages"/>
<!-- Swagger specs -->
<Route Url="/_spec" Method="GET" Call="SwaggerSpec" />
<!-- GET method to return JSON for a given person id-->
<Route Url="/images/:id" Method="GET" Call="GetImage"/>
<!-- Update a person with id-->
<Route Url="/images/:id" Method="PUT" Call="UpdateImage"/>
<!-- Delete a person with id-->
<Route Url="/images/:id" Method="DELETE" Call="DeleteImage"/>
<!-- Create a person-->
<Route Url="/images/" Method="POST" Call="CreateImage"/>

</Routes>
}

/// PersonsREST general information
ClassMethod GetInfo() As %Status
{
  SET version = ..#Version
  SET info = {
    "version": (version)
  }
  RETURN ..%ProcessResult($$$OK, info)
}

/// Retreive all the records of Sample.Person
ClassMethod GetAllImages() As %Status
{
    SET info={
        "Method" : ("created")
    }
    RETURN ..%ProcessResult($$$OK, info)
}

/// Return one record fo Sample.Person
ClassMethod GetImage(id As %Integer) As %Status
{
}

/// Creates a new Sample.Person record
ClassMethod CreateImage() As %Status
{
}

/// Update a record in Sample.Person with id
ClassMethod UpdateImage(id As %Integer) As %Status
{
}

/// Delete a record with id in Sample.Person
ClassMethod DeleteImage(id As %Integer) As %Status
{
}

ClassMethod SwaggerSpec() As %Status
{
  Set tSC = ##class(%REST.API).GetWebRESTApplication($NAMESPACE, %request.Application, .swagger)
  Do swagger.info.%Remove("x-ISC_Namespace")
  Set swagger.basePath = "/crud"
  Set swagger.info.title = "InterSystems IRIS REST CRUD demo"
  Set swagger.info.version = "0.1"
  Set swagger.host = "localhost:52773"
  Return ..%ProcessResult($$$OK, swagger)
}

}
