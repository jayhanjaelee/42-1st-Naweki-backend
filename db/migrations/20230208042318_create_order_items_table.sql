-- migrate:up
CREATE TABLE `order_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `quantity` int,
  `price` float,
  `order_id` int,
  `product_id` int,
  `order_item_status_code_id` int,

  CONSTRAINT order_items_order_id_fk FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT order_items_product_id_fk FOREIGN KEY (product_id) REFERENCES products (id),
  CONSTRAINT order_items_order_item_status_code_fk FOREIGN KEY (order_item_status_code_id) REFERENCES orders_status_codes (id),
  CONSTRAINT order_items_order_item_status_code_id_uk UNIQUE (order_item_status_code_id)
)

-- migrate:down
DROP TABLE order_items;
