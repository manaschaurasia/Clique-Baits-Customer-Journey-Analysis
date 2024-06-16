# Users Table #
Contains information about customers who visit the Clique Bait website, tagged via their cookie_id.

markdown
Copy code
| Column      | Description                                 |
|-------------|---------------------------------------------|
| `user_id`   | Unique identifier for the user              |
| `cookie_id` | Identifier for tracking user activity       |
| `start_date`| Date when the user first visited            |
Events Table
Logs customer visits at a cookie_id level, including event type and page visited. The sequence_number orders the events within each visit.

markdown
Copy code
| Column           | Description                                                |
|------------------|------------------------------------------------------------|
| `visit_id`       | Unique identifier for the visit                            |
| `cookie_id`      | Identifier for tracking user activity                      |
| `page_id`        | ID of the page visited                                     |
| `event_type`     | Type of event (e.g., Page View, Add to Cart)               |
| `sequence_number`| Order of the events within each visit                      |
| `event_time`     | Timestamp of the event                                     |
Event Identifier Table
Shows the types of events captured by Clique Bait’s digital data systems.

markdown
Copy code
| Column       | Description                                |
|--------------|--------------------------------------------|
| `event_type` | Unique identifier for the event type       |
| `event_name` | Name of the event (e.g., Page View, Add to Cart) |
Campaign Identifier Table
Provides information on the marketing campaigns run on the Clique Bait website in 2020.

markdown
Copy code
| Column         | Description                                 |
|----------------|---------------------------------------------|
| `campaign_id`  | Unique identifier for the campaign          |
| `products`     | IDs of products included in the campaign    |
| `campaign_name`| Name of the campaign                        |
| `start_date`   | Campaign start date                         |
| `end_date`     | Campaign end date                           |
Page Hierarchy Table
Lists all pages on the Clique Bait website tagged for data collection through user interaction events.

markdown
Copy code
| Column            | Description                                  |
|-------------------|----------------------------------------------|
| `page_id`         | Unique identifier for the page               |
| `page_name`       | Name of the page                             |
| `product_category`| Category of the product displayed on the page|
| `product_id`      | ID of the product displayed on the page      |
