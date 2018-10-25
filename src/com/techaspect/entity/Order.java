/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */
package com.techaspect.entity;

/**
 * The Order class represents a Order Details Record.
 * It includes properties for storing data and methods for
 * retrieving & setting values in the properties.
 * 
 * @author  Kishan Kumar
 */

import java.io.Serializable;

public class Order implements Serializable{
	/** The value is used for int storage representing Order Total Cost. */
	private int totalCost;
	/** The value is used for int storage representing Order Shipping Cost. */
	private int shippingCost;
	/** The value is used for int storage representing Order Product Cost. */
	private int productCost;
	/** The value is used for int storage representing Order Tax Cost. */
	private int taxCost;
	/** The value is used for int storage representing Order ID. */
	private int orderId;
	/** The value is used for String storage representing Order date. */
	private String orderDate;
	/** The value is used for String storage representing Order Status. */
	private String orderStatus;
	/**
     * Retrieves the value of the property totalCost.
     *
     * @return     A int value.
     *             The total cost of the order.
     */
	public int getTotalCost() {
		return totalCost;
	}
	/**
     * Sets a value to the property totalCost.
     *
     * @param      A int value.
     *              The total cost of the order.
     */
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	/**
     * Retrieves the value of the property shippingCost.
     *
     * @return     A int value.
     *             The shipping cost of the order.
     */
	public int getShippingCost() {
		return shippingCost;
	}
	/**
     * Sets a value to the property shippingCost.
     *
     * @param      A int value.
     *              The shipping cost of the order.
     */
	public void setShippingCost(int shippingCost) {
		this.shippingCost = shippingCost;
	}
	/**
     * Retrieves the value of the property taxCost.
     *
     * @return     A int value.
     *             The tax cost of the order.
     */
	public int getTaxCost() {
		return taxCost;
	}
	/**
     * Sets a value to the property taxCost.
     *
     * @param      A int value.
     *              The tax cost of the order.
     */
	public void setTaxCost(int taxCost) {
		this.taxCost = taxCost;
	}
	/**
     * Retrieves the value of the property orderId.
     *
     * @return     A int value.
     *             The order id of the order.
     */
	public int getOrderId() {
		return orderId;
	}
	/**
     * Sets a value to the property orderId.
     *
     * @param      A int value.
     *              The order id of the order.
     */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	/**
     * Retrieves the value of the property orderDate.
     *
     * @return     A code String value.
     *             The order date of order.
     */
	public String getOrderDate() {
		return orderDate;
	}
	/**
     * Sets a value to the property orderDate.
     *
     * @param      A String value.
     *             The order date of order.
     */
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	/**
     * Retrieves the value of the property orderStatus.
     *
     * @return     A code String value.
     *             The order status.
     */
	public String getOrderStatus() {
		return orderStatus;
	}
	/**
     * Sets a value to the property orderStatus.
     *
     * @param      A String value.
     *             The order status.
     */
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	/**
     * Retrieves the value of the property productCost.
     *
     * @return     A int value.
     *             The product cost of the order.
     */
	public int getProductCost() {
		return productCost;
	}
	/**
     * Sets a value to the property productCost.
     *
     * @param      A int value.
     *              The product cost of the order.
     */
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	
	
}
