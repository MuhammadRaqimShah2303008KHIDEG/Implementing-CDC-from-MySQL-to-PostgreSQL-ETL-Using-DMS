-- Data Validation check for Card Data
CREATE PROCEDURE `P_MC_insert_t_live_import_counts`()
BEGIN

delete from t_live_import_counts
where `date` = current_date-1 AND `product` = 'MPGS_Card' AND `db` = 'Live';

insert into t_live_import_counts
select 'MPGS_Card', date(createdDate), count(*), 'Live', 'api_logs'
from api_logs
where date(createdDate) = current_date-1
group by date(createdDate)
union all
select 'MPGS_Card', date(createdDate), count(*), 'Live', 'card_user_safepay_tokens'
from card_user_safepay_tokens
where date(createdDate) = current_date-1
group by date(createdDate)
union all
select 'MPGS_Card', date(created_at), count(*), 'Live', 'payment_redirects_url'
from payment_redirects_url
where date(created_at) = current_date-1
group by date(created_at)
union all
select 'MPGS_Card', date(tran_insert_date), count(*), 'Live', concat('sc_transaction- status(',status,')')
from transactions
where date(tran_insert_date) = current_date-1
group by date(tran_insert_date), status
union all
select 'MPGS_Card', (current_date-1), count(*), 'Live', 'external_responses'
from external_responses
union all
select 'MPGS_Card', date(created_time), count(*), 'Live', 'postback'
from postback
where date(created_time) = current_date-1
group by date(created_time)
union all
select 'MPGS_Card', date(createdDateTime), count(*), 'Live', 'merchant_webhooks'
from merchant_webhooks
where date(createdDateTime) = current_date-1
group by date(createdDateTime)
UNION ALL
select 'MPGS_Card', date(created_date), count(*), 'Live', 'card_metadata'
from card_metadata
where date(created_date) = current_date-1
group by date(created_date)
UNION ALL
select 'MPGS_Card', date(createdDate), count(*), 'Live', 'transaction_refund'
from transaction_refund
where date(createdDate) = current_date-1
group by date(createdDate)
UNION ALL
select 'MPGS_Card', date(createdDate), count(*), 'Live', 'refund_requests'
from refund_requests
where date(createdDate) = current_date-1
group by date(createdDate)
UNION ALL
select 'MPGS_Card', date(created_date), count(*), 'Live', 'refund_transaction_status'
from refund_transaction_status
where date(created_date) = current_date-1
group by date(created_date);
commit;

END;

CREATE TABLE `t_live_import_counts` (
  `product` text,
  `date` date DEFAULT NULL,
  `count` bigint DEFAULT NULL,
  `db` text,
  `table_name` text
);

CREATE EVENT ev_insert_t_live_import_counts
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE, '02:15:00')
DO
CALL `P_MC_insert_t_live_import_counts`();

-- -----------------------------------------------------
-- MySQL Privelages for DMS
-- -----------------------------------------------------

GRANT Create Temporary Tables, Lock Tables, Replication Client, Replication Slave, Select, Show Databases, Show View ON *.* TO `dms_mysql`@`%`;

GRANT Select ON TABLE `mysql`.`db` TO `dms_mysql`@`%`;

GRANT Select ON TABLE `mysql`.`rds_configuration` TO `dms_mysql`@`%`;

GRANT Select ON TABLE `mysql`.`role_edges` TO `dms_mysql`@`%`;

GRANT Select ON TABLE `mysql`.`tables_priv` TO `dms_mysql`@`%`;

GRANT Select ON TABLE `mysql`.`user` TO `dms_mysql`@`%`;

GRANT Select ON TABLE `performance_schema`.`replication_connection_status` TO `dms_mysql`@`%`;
