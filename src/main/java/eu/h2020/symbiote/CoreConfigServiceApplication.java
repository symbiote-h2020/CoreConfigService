package eu.h2020.symbiote;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class CoreConfigServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoreConfigServiceApplication.class, args);
	}
}
