package fr.duprey.easyb.sample;

import org.openqa.selenium.server.SeleniumServer

import com.thoughtworks.selenium.DefaultSelenium

scenario "an invalid password has been entered", {

	given "selenium is up and running", {
		server = new SeleniumServer();
		server.start();
		selenium = new DefaultSelenium("localhost",
				4444, "*firefox", "https://github.com/")
		selenium.start()
	}

	when "filling out the connexion form with somebody's credentials", {
		selenium.open("/login")
		selenium.waitForPageToLoad("1000")
		selenium.type("login_field", "nephtys")
		selenium.type("password", "42")
	}

	and "the submit link has been clicked", { selenium.click("commit") }

	then "the page should display an error message", {
		selenium.waitForPageToLoad("1000")
		selenium.getText("css=div.formbody div.error_box").shouldBeEqualTo "Incorrect login or password."
	}

	and "selenium should be stopped", {
		selenium.stop()
		server.stop()
	}
}