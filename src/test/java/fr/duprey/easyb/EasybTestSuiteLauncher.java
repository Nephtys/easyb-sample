package fr.duprey.easyb;

import java.io.File;

import org.easyb.junit.EasybSuite;

/**
 * Lauches all easyb stories and specifications with JUnit
 */
public class EasybTestSuiteLauncher extends EasybSuite {

	@Override
	protected File baseDir() {
		return new File("src/test/easyb");
	}

	@Override
	protected String description() {
		return "Easyb Test Suite";
	}

}
