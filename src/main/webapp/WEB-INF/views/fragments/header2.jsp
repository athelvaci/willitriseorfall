<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <meta charset="utf-8">
 <meta http-equiv="content-type" content="text/html; charset=utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Will it Rise or Fall?</title>
    <link rel="stylesheet" href="<spring:url value="/resources/css/font-awesome.min.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<spring:url value="/resources/css/prettyPhoto.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<spring:url value="/resources/css/animate.css"/>" type="text/css"/>
    <link rel="stylesheet" href="<spring:url value="/resources/css/main.css"/>" type="text/css"/>  
          <link rel="stylesheet" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-bootgrid/1.3.1/jquery.bootgrid.css">
      
    <link rel="shortcut icon" href="resources/images/ico/favicon-16x16.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-bootgrid/1.3.1/jquery.bootgrid.js"></script>
      <script>
         $(document).ready(function(){
             
             $("#grid-basic").bootgrid({
            	    ajax: false,
            	    post: function ()
            	    {
            	        /* To accumulate custom parameter with the request object */
            	        return {
            	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            	        };
            	    },
            	    url: "#",
            	    formatters: {
            	        "link": function(column, row)
            	        {
            	            return "<a href=\"/user-profile/" +  row.predictorname  + "\">" + row.predictorname + "</a>";
            	        }
            	    }
            	});
             
         });
         
         
      </script> 
      