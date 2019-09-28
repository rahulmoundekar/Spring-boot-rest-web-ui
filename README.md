# Spring-boot-rest-web-ui
Spring boot rest web application with boostrap ui 

REST is REpresentational State Transfer. REST or RESTful web services provide communication medium between software applications on the Internet. REST uses uniform and predefined set of stateless operations. RESTful web service can produce and consume JSON, XML and other media types.

  ### @RestController: 
  It is used at class level to make RESTful web service endpoints. @RestController is combination of @Controller and @ResponseBody. 
  ### @GetMapping: 
  It is @RequestMapping with HTTP GET method. 
  ### @PostMapping: 
  It is @RequestMapping with HTTP POST method. 
  ### @PutMapping: 
  It is @RequestMapping with HTTP PUT method. 
  ### @DeleteMapping: 
  It is @RequestMapping with HTTP DELETE method. 
  ### @PatchMapping: 
  It is @RequestMapping with HTTP PATCH method. 

  ### @PathVariable: 
  It indicates that a method parameter should be bound to a URI template variable. 
  ### @RequestBody: 
  It is used with the method parameter to bind the body of the web request. 
  ### @RequestParam: 
  It is used with method parameter to bind the web request parameter. 

  ### ResponseEntity: 
  It is the extension of HttpEntity that represents HTTP request or response entity, consisting of headers and body. 
  
  Produces and Consumes annotations are used for sharing theContent-Type and Accept headers information respectively with your webservice users. Content-type header will help the receiver/consumer of your service, to treat the response as per the information in that header. If you mark the value of content-type header as application/json, then receiver can accordingly use a json parser. Similarly, using the Consumes, you are assuring that Accept header is application/json so that you can do the json parsing/unmarshalling accordingly.
