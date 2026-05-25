CREATE SEQUENCE "simpaisa_datasource"."sc_transaction_whId_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


CREATE TABLE "simpaisa_datasource"."sc_transaction" (
  "whId" "pg_catalog"."int4" NOT NULL DEFAULT nextval('"simpaisa_datasource"."sc_transaction_whId_seq"'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "tran_id" "pg_catalog"."int8" NOT NULL,
  "tran_amt_charged" "pg_catalog"."float8",
  "tran_curr_code" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_payment_type" "pg_catalog"."int4",
  "tran_reference_no" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_description" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_capture" "pg_catalog"."int2",
  "tran_capture_date" "pg_catalog"."timestamp",
  "tran_insert_date" "pg_catalog"."timestamp",
  "tran_cust_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_addr_id" "pg_catalog"."int8",
  "flag_3ds" "pg_catalog"."int2" DEFAULT '1'::smallint,
  "tran_prev_payment_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "status" "pg_catalog"."int4" DEFAULT 0,
  "update_date" "pg_catalog"."timestamp",
  "source_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_capture_status" "pg_catalog"."int4" DEFAULT 0,
  "tran_auth_status" "pg_catalog"."int4" DEFAULT 0,
  "integration_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "merchant_channel_code" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "merchant_id" "pg_catalog"."int8",
  "orderId" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "capture_reference" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "success_url" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "failure_url" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_pay_status" "pg_catalog"."int4" DEFAULT 0,
  "sourceType" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "auto_void_flag" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "card_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "customer_ref" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  CONSTRAINT "sc_transaction_key" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."sc_transaction_whId_seq"
OWNED BY "simpaisa_datasource"."sc_transaction"."whId";


ALTER TABLE "simpaisa_datasource"."sc_transaction" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "src_tran_dbid_tran_id_idx" ON "simpaisa_datasource"."sc_transaction" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "tran_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);



-- ------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."card_metadata_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."card_metadata" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".card_metadata_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "trans_id" "pg_catalog"."int8",
  "reference" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "source_data" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "created_date" "pg_catalog"."timestamp",
  CONSTRAINT "card_metadata_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."card_metadata_whid_seq"
OWNED BY "simpaisa_datasource"."card_metadata"."whId";


ALTER TABLE "simpaisa_datasource"."card_metadata" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "card_metadata_dbid_id_idx" ON "simpaisa_datasource"."card_metadata" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- -----------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."transaction_refund_whId_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


CREATE TABLE "simpaisa_datasource"."transaction_refund" (
  "whId" "pg_catalog"."int4" NOT NULL DEFAULT nextval('"simpaisa_datasource"."transaction_refund_whId_seq"'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "transactionId" "pg_catalog"."int8" NOT NULL,
  "referenceNumber" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "status" "pg_catalog"."int4",
  "createdDate" "pg_catalog"."timestamp" DEFAULT NULL::timestamp without time zone,
  "updatedDate" "pg_catalog"."timestamp" DEFAULT NULL::timestamp without time zone,
  "amount" "pg_catalog"."float8",
  "transReferenceNumber" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "refundReferenceNumber" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  CONSTRAINT "transaction_refund_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."transaction_refund_whId_seq"
OWNED BY "simpaisa_datasource"."transaction_refund"."whId";

ALTER TABLE "simpaisa_datasource"."transaction_refund" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "transaction_refund_dbid_id_idx" ON "simpaisa_datasource"."transaction_refund" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- --------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."refund_requests_whId_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."refund_requests" (
  "whId" "pg_catalog"."int4" NOT NULL DEFAULT nextval('"simpaisa_datasource"."refund_requests_whId_seq"'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "mobileNo" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "transactionId" "pg_catalog"."int8",
  "referenceNumber" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "status" "pg_catalog"."int4",
  "createdDate" "pg_catalog"."timestamp" DEFAULT NULL::timestamp without time zone,
  "cnic" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "amount" "pg_catalog"."float8",
  "payment_ids" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "isPartial" "pg_catalog"."int4" DEFAULT 0,
  "updatedDate" "pg_catalog"."timestamp" DEFAULT NULL::timestamp without time zone,
  "merchantId" "pg_catalog"."int8",
  "operatorId" "pg_catalog"."int8",
  "reference" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "isReversed" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "isRefunded" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "refundReferenceNumber" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "refundUserKey" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "isManualRefund" "pg_catalog"."int2" DEFAULT 0,
  "userKey" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "currency" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "chargebackId" "pg_catalog"."int8",
  "payableAmount" "pg_catalog"."float8",
  "chargedAmount" "pg_catalog"."float8",
  "payableRefund" "pg_catalog"."float8",
  "feeAmount" "pg_catalog"."float8",
  "feeAppliedState" "pg_catalog"."int2" DEFAULT '0'::smallint,
  CONSTRAINT "refund_requests_pkey" PRIMARY KEY ("whId"),
  CONSTRAINT "rr_dbid_id_uk" UNIQUE ("dbId", "id")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."refund_requests_whId_seq"
OWNED BY "simpaisa_datasource"."refund_requests"."whId";

ALTER TABLE "simpaisa_datasource"."refund_requests" 
  OWNER TO "dms_user";

CREATE INDEX "idx_refund_requests_txid_status" ON "simpaisa_datasource"."refund_requests" USING btree (
  "transactionId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "status" "pg_catalog"."int4_ops" ASC NULLS LAST
);

CREATE UNIQUE INDEX "refund_requests_dbid_id_idx" ON "simpaisa_datasource"."refund_requests" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

COMMENT ON COLUMN "simpaisa_datasource"."refund_requests"."feeAppliedState" IS '1 = Success, 0 = Pending, 2 = Failed';

-- ----------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."refund_transaction_status_whId_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."refund_transaction_status" (
  "whId" "pg_catalog"."int4" NOT NULL DEFAULT nextval('"simpaisa_datasource"."refund_transaction_status_whId_seq"'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "transaction_id" "pg_catalog"."int8",
  "refund" "pg_catalog"."int8",
  "created_date" "pg_catalog"."timestamp",
  "updated_date" "pg_catalog"."timestamp",
  CONSTRAINT "refund_transaction_status_pkey" PRIMARY KEY ("whId")
);
-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."refund_transaction_status_whId_seq"
OWNED BY "simpaisa_datasource"."refund_transaction_status"."whId";

ALTER TABLE "simpaisa_datasource"."refund_transaction_status" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "refund_txn_status_dbid_id_idx" ON "simpaisa_datasource"."refund_transaction_status" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ---------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."apilogs_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."api_logs" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".apilogs_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "logId" "pg_catalog"."int8" NOT NULL,
  "action" "pg_catalog"."int4",
  "createdDate" "pg_catalog"."timestamp",
  "platform" "pg_catalog"."int4",
  "transaction_transactionID" "pg_catalog"."int8",
  "comments" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "recursion_recursionID" "pg_catalog"."int8",
  "ResponseCode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "Response" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "operatorId" "pg_catalog"."int8",
  "extResponseCode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "extResponse" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "intResponseCode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "intResponse" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "apiOperation" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "tran_reference_Id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "channelCode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "errorReason" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  CONSTRAINT "api_logs_pkey" PRIMARY KEY ("whId"),
  CONSTRAINT "al_dbid_logid_uk" UNIQUE ("dbId", "logId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."apilogs_whid_seq"
OWNED BY "simpaisa_datasource"."api_logs"."whId";


ALTER TABLE "simpaisa_datasource"."api_logs" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "api_logs_dbid_logid_idx" ON "simpaisa_datasource"."api_logs" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "logId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

CREATE INDEX "indx_primary_key_dbid" ON "simpaisa_datasource"."api_logs" USING btree (
  "logId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- --------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."card_user_safepay_tokens_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."card_user_safepay_tokens" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".card_user_safepay_tokens_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "transactionID" "pg_catalog"."int8",
  "merchantID" "pg_catalog"."int8",
  "referenceId" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "card_channelID" "pg_catalog"."int8",
  "authToken" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "trackerToken" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "deviceDataCollectionJWT" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "deviceDataCollectionURL" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "status" "pg_catalog"."int2",
  "createdDate" "pg_catalog"."timestamp",
  "customer_reference" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "inquireAuthToken" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  CONSTRAINT "card_user_safepay_tokens_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."card_user_safepay_tokens_whid_seq"
OWNED BY "simpaisa_datasource"."card_user_safepay_tokens"."whId";

ALTER TABLE "simpaisa_datasource"."card_user_safepay_tokens" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "card_dbid_id_idx" ON "simpaisa_datasource"."card_user_safepay_tokens" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."payment_redirects_url_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."payment_redirects_url" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".payment_redirects_url_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "merchant_id" "pg_catalog"."int8",
  "unique_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "redirect_link" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "redirect_html" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "created_at" "pg_catalog"."timestamp",
  "updated_at" "pg_catalog"."timestamp",
  CONSTRAINT "payment_redirects_url_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."payment_redirects_url_whid_seq"
OWNED BY "simpaisa_datasource"."payment_redirects_url"."whId";

ALTER TABLE "simpaisa_datasource"."payment_redirects_url" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "payment_redirects_url_dbid_id_idx" ON "simpaisa_datasource"."payment_redirects_url" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."external_responses_whId_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."external_responses" (
  "whId" "pg_catalog"."int4" NOT NULL DEFAULT nextval('"simpaisa_datasource"."external_responses_whId_seq"'::regclass),
  "dbId" "pg_catalog"."int4",
  "id" "pg_catalog"."int8",
  "extRespCode" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "extRespMessage" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "operatorId" "pg_catalog"."int8",
  "status" "pg_catalog"."int2",
  "intRespCode" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "intRespMessage" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "retryEnabled" "pg_catalog"."int2",
  "precEnabled" "pg_catalog"."int2",
  "decision" "pg_catalog"."int2",
  "stuck" "pg_catalog"."int2",
  "retryMins" "pg_catalog"."int2",
  "inquire" "pg_catalog"."int4" DEFAULT 0,
  "createdDate" "pg_catalog"."timestamp",
  "updatedDate" "pg_catalog"."timestamp",
  "in_inquire" "pg_catalog"."int4" DEFAULT 0,
  "titleFetch" "pg_catalog"."int4" DEFAULT 0,
  "inInquire" "pg_catalog"."int4" DEFAULT 0,
  "inInquireRetry" "pg_catalog"."int4" DEFAULT 0,
  "channel_code" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "decisionTransactionPending" "pg_catalog"."int2" DEFAULT '0'::smallint,
  CONSTRAINT "external_responses_pkey" PRIMARY KEY ("whId")
);
-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."external_responses_whId_seq"
OWNED BY "simpaisa_datasource"."external_responses"."whId";

ALTER TABLE "simpaisa_datasource"."external_responses" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "external_responses_dbid_id_idx" ON "simpaisa_datasource"."external_responses" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- -----------------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."postback_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."postback" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".postback_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "url" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "merchant_id" "pg_catalog"."int8",
  "product_id" "pg_catalog"."int8",
  "retries" "pg_catalog"."int4",
  "status" "pg_catalog"."int2",
  "postback_body" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "amount" "pg_catalog"."float8",
  "created_time" "pg_catalog"."timestamp",
  "update_time" "pg_catalog"."timestamp",
  CONSTRAINT "postback_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."postback_whid_seq"
OWNED BY "simpaisa_datasource"."postback"."whId";


ALTER TABLE "simpaisa_datasource"."postback" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "postback_dbid_id_idx" ON "simpaisa_datasource"."postback" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- -----------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."merchant_webhooks_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."merchant_webhooks" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".merchant_webhooks_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "id" "pg_catalog"."int8" NOT NULL,
  "status" "pg_catalog"."int4" DEFAULT 1,
  "merchantId" "pg_catalog"."int8",
  "platform" "pg_catalog"."int4",
  "postbackUrl" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "createdDateTime" "pg_catalog"."timestamp",
  CONSTRAINT "merchant_webhooks_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."merchant_webhooks_whid_seq"
OWNED BY "simpaisa_datasource"."merchant_webhooks"."whId";

ALTER TABLE "simpaisa_datasource"."merchant_webhooks" 
  OWNER TO "dms_user";

CREATE UNIQUE INDEX "merchant_webhooks_dbid_id_idx" ON "simpaisa_datasource"."merchant_webhooks" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- --------------------------------------------------------------------------------
CREATE SEQUENCE "simpaisa_datasource"."merchantdet_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

CREATE TABLE "simpaisa_datasource"."merchant_detail" (
  "whId" "pg_catalog"."int8" NOT NULL DEFAULT nextval('"simpaisa_datasource".merchantdet_whid_seq'::regclass),
  "dbId" "pg_catalog"."int4" NOT NULL,
  "merchantID" "pg_catalog"."int8" NOT NULL,
  "address" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "contact" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "status" "pg_catalog"."int4",
  "createdBy" "pg_catalog"."int8",
  "createdDateStr" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "description" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "email" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "firstName" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "lastName" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "phone" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "seceretKey" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "upatedBy" "pg_catalog"."int8",
  "updatedDateStr" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "country" "pg_catalog"."int8",
  "currency" "pg_catalog"."int8",
  "merchantType" "pg_catalog"."int8",
  "createdDate" "pg_catalog"."timestamp",
  "seceretWebKey" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "updatedDate" "pg_catalog"."timestamp",
  "website" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "payoutID" "pg_catalog"."int8",
  "sendSms" "pg_catalog"."int2",
  "postbackUrl" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "clientTitle" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "threshold" "pg_catalog"."int2",
  "allowWalletOtp" "pg_catalog"."int2",
  "sync_call" "pg_catalog"."int2",
  "postbackRetries" "pg_catalog"."int4",
  "serviceId" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "title" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "allowThreeD" "pg_catalog"."int2",
  "ch_crdnls" "pg_catalog"."int2",
  "inst_disburse" "pg_catalog"."int2",
  "max_amount_disb" "pg_catalog"."float8",
  "logo" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "auto_on_hold" "pg_catalog"."int2",
  "refund_threshold" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "simpaisaDomain" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "parentId" "pg_catalog"."int8",
  "companyTitle" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "amlCheck" "pg_catalog"."int2",
  "sharing" "pg_catalog"."int2",
  "orderPrefix" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "ftCheck" "pg_catalog"."int4",
  "genericResp" "pg_catalog"."int4",
  "fetchTitle" "pg_catalog"."int2",
  "reversedThreshold" "pg_catalog"."int4",
  "account_route" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "password" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "region" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT 'pk'::character varying,
  "instRemittance" "pg_catalog"."int4",
  "smsId" "pg_catalog"."int4",
  "smsPass" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "postback_retries" "pg_catalog"."int2",
  "maxAmountRemit" "pg_catalog"."float8",
  "currencyId" "pg_catalog"."int8",
  "isChild" "pg_catalog"."int4",
  "registerCustomer" "pg_catalog"."int4",
  "amountControl" "pg_catalog"."int4",
  "in_inquire_threshold" "pg_catalog"."int4" DEFAULT 0,
  "is_signature_enabled" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "recursive_sync_call" "pg_catalog"."int4" DEFAULT 1,
  "inst_remittance" "pg_catalog"."int2" NOT NULL DEFAULT '0'::smallint,
  "max_amount_remit" "pg_catalog"."float8" NOT NULL DEFAULT '0'::double precision,
  "disbMode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "allowTypeCard" "pg_catalog"."int2" NOT NULL DEFAULT '0'::smallint,
  "storeCardToken" "pg_catalog"."int2" NOT NULL DEFAULT '0'::smallint,
  "capture_interval" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "aml" "pg_catalog"."int2",
  "fxmode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT '0'::character varying,
  "inInquireThreshold" "pg_catalog"."int4" NOT NULL DEFAULT 0,
  "credentialCode" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "inquireRefund" "pg_catalog"."int2" NOT NULL DEFAULT '0'::smallint,
  "nefRejection" "pg_catalog"."int2" NOT NULL DEFAULT 0,
  "manualRefund" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "directPayment" "pg_catalog"."int2",
  "chargebackExpiry" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "chargebackEnabled" "pg_catalog"."int2",
  "multipleMidThirdParty" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "thresholdThirdParty" "pg_catalog"."int4" DEFAULT 0,
  "minAmount" "pg_catalog"."float8" DEFAULT '0'::double precision,
  "thirdPartyRestriction" "pg_catalog"."int2" DEFAULT '0'::smallint,
  "rank" "pg_catalog"."int4",
  "bypassTitleFetch" "pg_catalog"."int2" DEFAULT 0,
  "inquireResponse" "pg_catalog"."int2",
  CONSTRAINT "merchant_detail_pkey" PRIMARY KEY ("whId")
);

-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "simpaisa_datasource"."merchantdet_whid_seq"
OWNED BY "simpaisa_datasource"."merchant_detail"."whId";

ALTER TABLE "simpaisa_datasource"."merchant_detail" 
  OWNER TO "dms_user";


CREATE UNIQUE INDEX "merchant_detail_dbid_merchantid_idx" ON "simpaisa_datasource"."merchant_detail" USING btree (
  "dbId" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "merchantID" "pg_catalog"."int8_ops" ASC NULLS LAST
);
-- ----------------------------------------------------------------------
CREATE TABLE "simpaisa_datasource"."t_live_import_counts" (
  "product" text ,
  "date" date,
  "count" INT8,
  "db" text,
  "table_name" text
);

-- -----------------------------------------------------------------------

-- add this into PROCEDURE "warehouse"."p_insert_daily_dwh_counts"()
insert into warehouse."t_etl_import_counts"
select 'MPGS_Card', date("createdDate"), count(*), 'DWH', 'api_logs'
from warehouse."api_logs"
where date("createdDate") = current_date-1 and "dbId"=8
group by date("createdDate")
union all
select 'MPGS_Card', date("createdDate"), count(*), 'DWH', 'card_user_safepay_tokens'
from warehouse."card_user_safepay_tokens"
where date("createdDate") = current_date-1 and "dbId"=8
group by date("createdDate")
union all
select 'MPGS_Card', date("created_at"), count(*), 'DWH', 'payment_redirects_url'
from warehouse."payment_redirects_url"
where date("created_at") = current_date-1 and "dbId"=8
group by date("created_at")
union all
select 'MPGS_Card', date("tran_insert_date"), count(*), 'DWH', concat('sc_transaction- status(',status,')')
from warehouse."sc_transaction"
where date("tran_insert_date") = current_date-1 and "dbId"=8
group by date("tran_insert_date"), status
union all
select 'MPGS_Card', (current_date-1), count(*), 'DWH', 'external_responses'
from warehouse."external_responses" WHERE "dbId"=8
union all
select 'MPGS_Card', date("created_time"), count(*), 'DWH', 'postback'
from warehouse."postback"
where date("created_time") = current_date-1 and "dbId"=8
group by date("created_time")
union all
select 'MPGS_Card', date("createdDateTime"), count(*), 'DWH', 'merchant_webhooks'
from warehouse."merchant_webhooks"
where date("createdDateTime") = current_date-1 and "dbId"=8
group by date("createdDateTime")
UNION ALL
select 'MPGS_Card', date("created_date"), count(*), 'DWH', 'card_metadata'
from warehouse."card_metadata"
where date("created_date") = current_date-1 and "dbId"=8
group by date("created_date")
UNION ALL
select 'MPGS_Card', date("createdDate"), count(*), 'DWH', 'transaction_refund'
from warehouse."transaction_refund"
where date("createdDate") = current_date-1 and "dbId"=8
group by date("createdDate")
UNION ALL
select 'MPGS_Card', date("createdDate"), count(*), 'DWH', 'refund_requests'
from warehouse."refund_requests"
where date("createdDate") = current_date-1 and "dbId"=8
group by date("createdDate")
UNION ALL
select 'MPGS_Card', date("created_date"), count(*), 'DWH', 'refund_transaction_status'
from warehouse."refund_transaction_status"
where date("created_date") = current_date-1 and "dbId"=8
group by date("created_date");
commit;
-- ------------------------------------------------------------------

ALTER TABLE warehouse."refund_requests" ADD COLUMN "isReversed" INT2,
ADD COLUMN "isRefunded" INT2,
ADD COLUMN "refundReferenceNumber" varchar(25);

ALTER TABLE warehouse."merchant_detail" 
ADD COLUMN "allowTypeCard" INT2,
ADD COLUMN "storeCardToken" INT2,
ADD COLUMN "capture_interval" INT2;

ALTER TABLE warehouse."transaction_refund"
ADD COLUMN "transReferenceNumber" varchar(255),
ADD COLUMN "refundReferenceNumber" varchar(255);

-- ----------------------------
-- Sequence structure for parent_merchant_balance_whid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "warehouse"."card_user_safepay_tokens_whid_seq";
CREATE SEQUENCE "warehouse"."card_user_safepay_tokens_whid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


-- ----------------------------
-- Set initial sequence value
-- ----------------------------
SELECT setval('"warehouse"."card_user_safepay_tokens_whid_seq"', 450164, true);


-- ----------------------------
-- Table structure for parent_merchant_balance
-- ----------------------------

CREATE TABLE warehouse."card_user_safepay_tokens" (
  "whId" BIGINT NOT NULL DEFAULT nextval('"warehouse".card_user_safepay_tokens_whid_seq'::regclass),
  "dbId" INT4 NOT NULL,
  "id" INT8 NOT NULL AUTO_INCREMENT,
  "transactionID" INT8 DEFAULT NULL,
  "merchantID" INT8 DEFAULT NULL,
  "referenceId" varchar(255) DEFAULT NULL,
  "card_channelID" INT8 DEFAULT NULL,
  "authToken" varchar(255) DEFAULT NULL,
  "trackerToken" varchar(255) DEFAULT NULL,
  "deviceDataCollectionJWT" text,
  "deviceDataCollectionURL" varchar(255) DEFAULT NULL,
  "status" INT2,
  "createdDate" timestamp DEFAULT NULL,
  "customer_reference" varchar(100) DEFAULT NULL,
  "inquireAuthToken" varchar(255) NOT NULL,
  CONSTRAINT "card_user_safepay_tokens_pkey" PRIMARY KEY ("whId")
);


-- ----------------------------
-- Alter sequence ownership
-- ----------------------------
ALTER SEQUENCE "warehouse"."card_user_safepay_tokens_whid_seq"
OWNED BY "warehouse"."card_user_safepay_tokens"."whId";


-- api_logs
CREATE UNIQUE INDEX "api_logs_dbid_logid_idx"
ON "warehouse"."api_logs" USING btree (
  "dbId" ASC NULLS LAST,
  "logId" ASC NULLS LAST
);

-- external_responses
CREATE UNIQUE INDEX "external_responses_dbid_id_idx"
ON "warehouse"."external_responses" USING btree (
  "dbId" ASC NULLS LAST,
  "id" ASC NULLS LAST
);

-- merchant_detail
CREATE UNIQUE INDEX "merchant_detail_dbid_merchantid_idx"
ON "warehouse"."merchant_detail" USING btree (
  "dbId" ASC NULLS LAST,
  "merchantID" ASC NULLS LAST
);

-- refund_transaction_status
CREATE UNIQUE INDEX "refund_txn_status_dbid_id_idx"
ON "warehouse"."refund_transaction_status" USING btree (
  "dbId" ASC NULLS LAST,
  "id" ASC NULLS LAST
);

-- transaction_refund
CREATE UNIQUE INDEX "transaction_refund_dbid_id_idx"
ON "warehouse"."transaction_refund" USING btree (
  "dbId" ASC NULLS LAST,
  "id" ASC NULLS LAST
);

-- postback
CREATE UNIQUE INDEX "postback_dbid_id_idx"
ON "warehouse"."postback" USING btree (
  "dbId" ASC NULLS LAST,
  "id" ASC NULLS LAST
);



