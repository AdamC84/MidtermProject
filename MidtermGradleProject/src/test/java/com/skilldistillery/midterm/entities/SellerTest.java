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

class SellerTest {

	static EntityManagerFactory emf;
	EntityManager em;
	Seller seller;

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
		seller = new Seller();
		seller.setBankName("Citi");
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		seller = null;
	}

	@Test
	@Disabled
	void test() {
		assertEquals(1, 1);
	}
	
	@Test
	void test_driver_mapping(){
		assertEquals("Citi", seller.getBankName());
	}

}
