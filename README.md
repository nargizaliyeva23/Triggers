# 🛒 E-Commerce MySQL Triggers

This project contains MySQL triggers for an e-commerce platform.
The triggers are designed to automate business rules, maintain data integrity, and support analytics.

### 🆕 Customer’s First Order Tracking

Purpose:

Automatically records the first order date for each customer.

When a new order is inserted into the orders table, the trigger updates the customer’s first_order_date if it is currently empty.

This ensures accurate tracking of new customers and their initial purchase behavior.

No manual intervention is required; the system updates the date automatically.

### 📦 Order Status Change Logger

Purpose:

Tracks changes in order status for each order.

When an order’s status is updated in the orders table, the trigger automatically logs:

-The order ID

-The old status

-The new status

-The timestamp of the change

This ensures a complete audit trail of order status changes.



### 💳 Payment Validation Trigger

Purpose:

Ensures payment data integrity.

When a new payment is inserted, the trigger checks that the payment value is not negative.

If the value is negative, the insert operation is blocked and an error message is raised.

Benefit: Maintains accurate financial records.



### 🏪 Seller Existence Validation

Purpose:

Validates that a seller exists before associating them with an order.

If the seller_id does not exist in the sellers table, the insert operation fails.

Benefit: Ensures orders are only linked to valid sellers, maintaining data integrity.




### 🏙️ Restricting Sellers Based on Their Region

Purpose:

Ensures that orders are only placed with sellers from a specific region (e.g., SP).

When a new order item is inserted, the trigger checks the seller’s location in the sellers table.

If the seller is outside the allowed region, the insert operation is blocked with an error message.


### 🌐 Category Name Translation Sync

Purpose:

Keeps product category names synchronized between the translation table and the products table.

When a category name is updated in the translation table, the trigger updates all matching products automatically.

Benefit: Ensures consistent multilingual data, with accurate category names across languages.


### 💰 High-Value Payments Logging

Purpose:

Logs payments that exceed a defined threshold (e.g., $1000) into a separate table for monitoring and reporting.

The trigger activates on each new payment insert and adds a log entry if the payment is high.

Benefit: Enables risk monitoring and facilitates financial reporting.
