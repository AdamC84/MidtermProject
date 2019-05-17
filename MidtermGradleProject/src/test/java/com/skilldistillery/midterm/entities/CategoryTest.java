package com.skilldistillery.midterm.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class CategoryTest {

	static EntityManagerFactory emf;
	EntityManager em;
	Category c;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("CitySprouts");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		c = new Category();
		c.setName("fruit");
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		c = null;
	}

	@Test
	@Disabled
	void test() {
		assertEquals(1, 1);
	}
	
	@Test
	void test_driver_mapping(){
		assertEquals("fruit", c.getName());
	}

}
