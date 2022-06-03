package com.devpro.shoppet.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//Định nghĩa 1 Bean trong Spring sử dụng @Configuration(dành cho cấu hình)
//Trong spring sẽ làm việc chủ yếu với Bean
@Configuration
public class MVCConf implements WebMvcConfigurer {
	
	/**
	 * classpath: <-> src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**") .addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		registry.addResourceHandler("/bootstrap/**").addResourceLocations("classpath:/bootstrap/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/admin/");
		
//		đăng ký thêm folder upload
		
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");
	}
	@Bean // -> BEAN này dùng để chỉ ra thư mục chứa Views
	public ViewResolver viewResolver() {
		
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		//thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		// Đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");
		
		// Tên đuôi của View
		bean.setSuffix(".jsp");
		
		return bean;
		
	}
	
}
