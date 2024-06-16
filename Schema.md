## Users Table ##

Contains information about customers who visit the Clique Bait website, tagged via their cookie_id.

| Column      | Description                                 | Data Type  |
|-------------|---------------------------------------------|------------|
| `user_id`   | Unique identifier for the user              | INTEGER    |
| `cookie_id` | Identifier for tracking user activity       | STRING     |
| `start_date`| Date when the user first visited            | TIMESTAMP  |


## Events Table

Logs customer visits at a cookie_id level, including event type and page visited. The sequence_number orders the events within each visit.

| Column           | Description                                                | Data Type  |
|------------------|------------------------------------------------------------|------------|
| `visit_id`       | Unique identifier for the visit                            | STRING     |
| `cookie_id`      | Identifier for tracking user activity                      | STRING     |
| `page_id`        | ID of the page visited                                     | INTEGER    |
| `event_type`     | Type of event (e.g., Page View, Add to Cart)               | INTEGER    |
| `sequence_number`| Order of the events within each visit                      | INTEGER    |
| `event_time`     | Timestamp of the event                                     | TIMESTAMP  |


## Event Identifier Table

Shows the types of events captured by Clique Bait’s digital data systems.

| Column       | Description                                | Data Type  |
|--------------|--------------------------------------------|------------|
| `event_type` | Unique identifier for the event type       | INTEGER    |
| `event_name` | Name of the event (e.g., Page View, Add to Cart) | STRING     |


## Campaign Identifier Table

Provides information on the marketing campaigns run on the Clique Bait website in 2020.


| Column         | Description                                 | Data Type  |
|----------------|---------------------------------------------|------------|
| `campaign_id`  | Unique identifier for the campaign          | INTEGER    |
| `products`     | IDs of products included in the campaign    | STRING     |
| `campaign_name`| Name of the campaign                        | STRING     |
| `start_date`   | Campaign start date                         | TIMESTAMP  |
| `end_date`     | Campaign end date                           | TIMESTAMP  |


## Page Hierarchy Table

Lists all pages on the Clique Bait website tagged for data collection through user interaction events.


| Column            | Description                                  | Data Type  |
|-------------------|----------------------------------------------|------------|
| `page_id`         | Unique identifier for the page               | INTEGER    |
| `page_name`       | Name of the page                             | STRING     |
| `product_category`| Category of the product displayed on the page| STRING     |
| `product_id`      | ID of the product displayed on the page      | INTEGER    |
