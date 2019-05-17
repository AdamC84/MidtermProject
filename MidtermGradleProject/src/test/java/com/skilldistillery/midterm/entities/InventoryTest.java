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

class InventoryTest {

	static EntityManagerFactory emf;
	EntityManager em;
	Inventory i;

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
		i = new Inventory();
		i.setId(2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		i = null;
	}

	@Test
	@Disabled
	void test() {
		assertEquals(1, 1);
	}
	
	@Test
	void test_inventory_mapping(){
		assertEquals(2, i.getId());
		
	}

}
