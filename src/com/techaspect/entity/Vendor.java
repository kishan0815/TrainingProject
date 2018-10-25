/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.techaspect.entity;

/**
 * The Vendor class represents a Vendor Record.
 * It includes properties for storing data and methods for
 * retrieving & setting values in the properties.
 * 
 * @author  Kishan Kumar
 */

import java.io.Serializable;

public class Vendor implements Serializable{
	/** The value is used for int storage representing Vendor's ID. */
	private int venId;
	/** The value is used for string storage representing Vendor's First Name. */
	private String venFname;
	/** The value is used for string storage representing Vendor's Last Name. */
	private String venLname;
	/** The value is used for string storage representing Vendor's Date of Birth. */
	private String venDob;
	/** The value is used for string storage representing Vendor's Email Address. */
	private String venEmail;
	/** The value is used for string storage representing Vendor's Password. */
	private String venPassword;
	
	/**
     * Initializes a newly created Vendor object so that it represents
     * an empty Vendor.
     */
	public Vendor() {
	}
	/**
     * Initializes a newly created Vendor object so that it represents
     * a Vendor with attributes.
     *
     * @param  venId
     *         The Vendor ID.
     *         
     * @param  venFname
     *         The First Name of the Vendor.
     *         
     * @param  venLname
     *         The Last Name of the Vendor.
     *         
     * @param  venDob
     *         The Date of Birth of the Vendor.
     *         
     * @param  venEmail
     *         The Email Address of the Vendor.
     *          
     * @param  venPassword
     *         The password of the Vendor.
     */
	public Vendor(int venId, String venFname, String venLname, String venDob, String venEmail,
			String venPassword) {
		this.venId = venId;
		this.venFname = venFname;
		this.venLname = venLname;
		this.venDob = venDob;
		this.venEmail = venEmail;
		this.venPassword = venPassword;
	}
	/**
     * Retrieves the value of the property venId.
     *
     * @return     A code int value.
     *             The ID of Vendor.
     */
	public int getVenId() {
		return venId;
	}
	/**
     * Sets a value to the property venId.
     *
     * @param      A int value.
     *              The ID of Vendor.
     */
	public void setVenId(int venId) {
		this.venId = venId;
	}
	/**
     * Retrieves the value of the property venFname.
     *
     * @return     A code String value.
     *             The First Name of Vendor.
     */
	public String getVenFname() {
		return venFname;
	}
	/**
     * Sets a value to the property venFname.
     *
     * @param      A String value.
     *             The First Name of Vendor.
     */
	public void setVenFname(String venFname) {
		this.venFname = venFname;
	}
	/**
     * Retrieves the value of the property venLname.
     *
     * @return     A String value.
     *             The Last Name of Vendor.
     */
	public String getVenLname() {
		return venLname;
	}
	/**
     * Sets a value to the property venLname.
     *
     * @param      A String value.
     *              The Last Name of Vendor.
     */
	public void setVenLname(String venLname) {
		this.venLname = venLname;
	}
	/**
     * Retrieves the value of the property venDob.
     *
     * @return     A String value.
     *             The Date of Birth of Vendor.
     */
	public String getVenDob() {
		return venDob;
	}
	/**
     * Sets a value to the property venDob.
     *
     * @param      A String value.
     *             The Date of Birth of Vendor.
     */
	public void setVenDob(String venDob) {
		this.venDob = venDob;
	}
	/**
     * Retrieves the value of the property venEmail.
     *
     * @return     A String value.
     *             The Email Address of Vendor.
     */
	public String getVenEmail() {
		return venEmail;
	}
	/**
     * Sets a value to the property venEmail.
     *
     * @param      A String value.
     *             The Email Address of Vendor.
     */
	public void setVenEmail(String venEmail) {
		this.venEmail = venEmail;
	}
	/**
     * Retrieves the value of the property venPassword.
     *
     * @return     A String value.
     *             The Password of Vendor.
     */
	public String getVenPassword() {
		return venPassword;
	}
	/**
	* Sets a value to the property venPassword.
    *
    * @param      A String value.
    *             The Password of Vendor.
    */
	public void setVenPassword(String venPassword) {
		this.venPassword = venPassword;
	}

	
	
}
