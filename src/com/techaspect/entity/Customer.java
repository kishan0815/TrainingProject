/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.entity;

/**
 * The Customer class represents a Customer Record.
 * It includes properties for storing data and methods for
 * retrieving & setting values in the properties.
 * 
 * @author  Kishan Kumar
 */

import java.io.Serializable;

public class Customer implements Serializable{
	/** The value is used for int storage representing Customer's ID. */
	private int custId;
	/** The value is used for string storage representing Customer's First Name. */
	private String custFname;
	/** The value is used for string storage representing Customer's Last Name. */
	private String custLname;
	/** The value is used for string storage representing Customer's Date of Birth. */
	private String custDob;
	/** The value is used for string storage representing Customer's Gender. */
	private String custGender;
	/** The value is used for string storage representing Customer's Email Address. */
	private String custEmail;
	/** The value is used for string storage representing Customer's Contact Number. */
	private String custContact;
	/** The value is used for string storage representing Customer's Password. */
	private String custPassword;
	/** The value is used for string storage representing Customer's Address. */
	private String address="";
	/** The value is used for string storage representing Customer's City. */
	private String city="";
	/** The value is used for string storage representing Customer's zip code. */
	private String zip="";
	/** The value is used for string storage representing Customer's State. */
	private String state="";
	/** The value is used for string storage representing Customer's Country. */
	private String country="";
	
	/**
     * Initializes a newly created Customer object so that it represents
     * an empty Customer.
     */
	public Customer() {
	}

	/**
     * Initializes a newly created Customer object so that it represents
     * a Customer with attributes.
     *
     * @param  custId
     *         The Customer ID.
     *         
     * @param  custFname
     *         The First Name of the Customer.
     *         
     * @param  custLname
     *         The Last Name of the Customer.
     *         
     * @param  custDob
     *         The Date of Birth of the Customer.
     *         
     * @param  custGender
     *         The Gender of the Customer.
     *         
     * @param  custEmail
     *         The Email Address of the Customer.
     *         
     * @param  custContact
     *         The Contact number of the Customer.
     *         
     * @param  custPassword
     *         The password of the Customer.
     */
	public Customer(int custId, String custFname, String custLname, String custDob, String custGender, String custEmail,
			String custContact, String custPassword) {
		super();
		this.custId = custId;
		this.custFname = custFname;
		this.custLname = custLname;
		this.custDob = custDob;
		this.custGender = custGender;
		this.custEmail = custEmail;
		this.custContact = custContact;
		this.custPassword = custPassword;
	}

	/**
     * Retrieves the value of the property custId.
     *
     * @return     A code int value.
     *             The ID of Customer.
     */
	public int getcustId() {
		return custId;
	}
	/**
     * Sets a value to the property custId.
     *
     * @param      A int value.
     *              The ID of Customer.
     */
	public void setcustId(int custId) {
		this.custId = custId;
	}
	/**
     * Retrieves the value of the property custFname.
     *
     * @return     A code String value.
     *             The First Name of Customer.
     */
	public String getcustFname() {
		return custFname;
	}
	/**
     * Sets a value to the property custFname.
     *
     * @param      A String value.
     *             The First Name of Customer.
     */
	public void setcustFname(String custFname) {
		this.custFname = custFname;
	}
	/**
     * Retrieves the value of the property custLname.
     *
     * @return     A String value.
     *             The Last Name of Customer.
     */
	public String getcustLname() {
		return custLname;
	}
	/**
     * Sets a value to the property custLname.
     *
     * @param      A String value.
     *              The Last Name of Customer.
     */
	public void setcustLname(String custLname) {
		this.custLname = custLname;
	}
	/**
     * Retrieves the value of the property custDob.
     *
     * @return     A String value.
     *             The Date of Birth of Customer.
     */
	public String getcustDob() {
		return custDob;
	}
	/**
     * Sets a value to the property custDob.
     *
     * @param      A String value.
     *             The Date of Birth of Customer.
     */
	public void setcustDob(String custDob) {
		this.custDob = custDob;
	}
	/**
     * Retrieves the value of the property custGender.
     *
     * @return     A String value.
     *             The Gender of Customer.
     */
	public String getcustGender() {
		return custGender;
	}
	/**
     * Sets a value to the property custGender.
     *
     * @param      A String value.
     *             The Gender of Customer.
     */
	public void setcustGender(String custGender) {
		this.custGender = custGender;
	}
	/**
     * Retrieves the value of the property custEmail.
     *
     * @return     A String value.
     *             The Email Address of Customer.
     */
	public String getcustEmail() {
		return custEmail;
	}
	/**
     * Sets a value to the property custEmail.
     *
     * @param      A String value.
     *             The Email Address of Customer.
     */
	public void setcustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	/**
     * Retrieves the value of the property custContact.
     *
     * @return     A String value.
     *             The Contact number of Customer.
     */
	public String getcustContact() {
		return custContact;
	}
	/**
     * Sets a value to the property custContact.
     *
     * @param      A String value.
     *             The Contact number of Customer.
     */
	public void setcustContact(String custContact) {
		this.custContact = custContact;
	}
	/**
     * Retrieves the value of the property custPassword.
     *
     * @return     A String value.
     *             The Password of Customer.
     */
	public String getcustPassword() {
		return custPassword;
	}
	/**
	* Sets a value to the property custPassword.
    *
    * @param      A String value.
    *             The Password of Customer.
    */
	public void setcustPassword(String custPassword) {
		this.custPassword = custPassword;
	}
	/**
     * Retrieves the value of the property address.
     *
     * @return     A String value.
     *             The Address of Customer.
     */
	public String getAddress() {
		return address;
	}
	/**
	* Sets a value to the property address.
    *
    * @param      A String value.
    *             The Address of Customer.
    */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
     * Retrieves the value of the property city.
     *
     * @return     A String value.
     *             The City of Customer.
     */
	public String getCity() {
		return city;
	}
	/**
	* Sets a value to the property city.
    *
    * @param      A String value.
    *             The city of Customer.
    */
	public void setCity(String city) {
		this.city = city;
	}
	/**
     * Retrieves the value of the property zip.
     *
     * @return     A String value.
     *             The zip code of Customer.
     */
	public String getZip() {
		return zip;
	}
	/**
	* Sets a value to the property zip.
    *
    * @param      A String value.
    *             The zip code of Customer.
    */
	public void setZip(String zip) {
		this.zip = zip;
	}
	/**
     * Retrieves the value of the property state.
     *
     * @return     A String value.
     *             The state of Customer.
     */
	public String getState() {
		return state;
	}
	/**
	* Sets a value to the property state.
    *
    * @param      A String value.
    *             The state of Customer.
    */
	public void setState(String state) {
		this.state = state;
	}
	/**
     * Retrieves the value of the property country.
     *
     * @return     A String value.
     *             The Country of Customer.
     */
	public String getCountry() {
		return country;
	}
	/**
	* Sets a value to the property country.
    *
    * @param      A String value.
    *             The country of Customer.
    */
	public void setCountry(String country) {
		this.country = country;
	}

	
}
