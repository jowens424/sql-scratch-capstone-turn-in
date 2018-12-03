SELECT *
            FROM survey
	LIMIT 10;


2.  SELECT question,
 	COUNT(DISTINCT user_id)
 FROM survey
 GROUP BY question;

 4.

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

5.

SELECT DISTINCT q.user_id,
  h.user_id IS NOT NULL AS 'is_home_try_on',

  h.number_of_pairs,

  p.user_id IS NOT NULL AS 'is_purchase'

FROM quiz q

LEFT JOIN home_try_on h

  ON q.user_id = h.user_id

LEFT JOIN purchase p

  ON p.user_id = q.user_id

LIMIT 10;



6.

SELECT DISTINCT q.user_id AS user_id,

(SELECT COUNT(*)

FROM home_try_on ht WHERE ht.user_id = q.user_id) AS is_home_try_on,

  h.number_of_pairs,

  p.user_id IS NOT NULL AS is_purchase

FROM quiz q

LEFT JOIN home_try_on h

  ON h.user_id = q.user_id

LEFT JOIN purchase p

  ON p.user_id = q.user_id

WHERE h.user_id IS NOT NULL

LIMIT 30;



SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs, p.model_name, p.color, p.price,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 30;
