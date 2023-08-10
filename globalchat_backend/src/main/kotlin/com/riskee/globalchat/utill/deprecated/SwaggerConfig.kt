//package com.riskee.globalchat.config
//
//import org.springframework.context.annotation.Bean
//import org.springframework.context.annotation.Configuration
//import springfox.documentation.builders.PathSelectors
//import springfox.documentation.builders.RequestHandlerSelectors
//import springfox.documentation.spi.DocumentationType
//import springfox.documentation.spring.web.plugins.Docket
//import springfox.documentation.swagger2.annotations.EnableSwagger2
//
//@Configuration
//@EnableSwagger2
//class SwaggerConfig {
//    @Bean
//    fun getDocket(): Docket? {
//        return Docket(DocumentationType.SWAGGER_2)
//            .select()
//            .apis(RequestHandlerSelectors.any())
//            .paths(PathSelectors.any())
//            .build()
//    }
////    @Bean
////    fun api() = Docket(DocumentationType.SWAGGER_2)
////        .apiInfo(apiInfo())
////        .select()
////        .apis(RequestHandlerSelectors.withClassAnnotation(RestController::class.java))
////        .paths(PathSelectors.any())
////        .build()
////        .tags(Tag("user-controller", "These endpoints are used to manage the users details.", 1))
////
////    private fun apiInfo() = ApiInfoBuilder()
////        .title("API Documentation")
////        .description("API Documentation Using Swagger2 on Spring Boot Project")
////        .version("1.0")
////        .build()
//}