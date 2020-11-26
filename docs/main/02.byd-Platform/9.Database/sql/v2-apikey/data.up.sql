BEGIN;

WITH vars AS (
  SELECT 
    status.pk_id as statusid,
    account.pk_id as accountid
  FROM 
    beyond_core.account as account,
    beyond_core.status as status 
  WHERE account.email = 'ludovic.wyffels-isc.france@fr.ibm.com'
  AND status.code = 'ACTIF'
)
INSERT INTO beyond_core.apikey
  (fk_product, code, apikey_name, "role", fk_statusid, created_by, updated_by)
VALUES 
  ((SELECT pk_id FROM beyond_core.product WHERE label = 'BEYOND MANAGER'), 'BEYOND_MANAGER', 'Beyond Manager API Key', 'PROVIDER', ((SELECT statusid FROM vars)), (SELECT accountid FROM vars), (SELECT accountid FROM vars)),
  ((SELECT pk_id FROM beyond_core.product WHERE label = 'REALITY MANAGER'), 'REALITY_MANAGER', 'Reality Manager API Key', 'PROVIDER', ((SELECT statusid FROM vars)), (SELECT accountid FROM vars), (SELECT accountid FROM vars));

-- SELECT * FROM beyond_core.apikey;

END;
