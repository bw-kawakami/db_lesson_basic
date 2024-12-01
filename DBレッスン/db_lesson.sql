Q1
CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
ALTER TABLE people ADD department_name VARCHAR(20) NOT NULL AFTER department_id;
Q3
INSERT INTO people (department_id, department_name)
VALUES
(1, '営業'),
(2, '開発'),
(3, '経理'),
(4, '人事'),
(5, '情報システム'),
;

INSERT INTO people (department_id, name, age, gender)
VALUES
(1, '沢木 真理子', 30, 2),
(5, '松岡 昌徳', 20, 1),
(2, '久保 隆夫', 46, 1),
(1, '山本 利一', 35, 1),
(2, '美咲 友紀', 51, 2),
(3, '倉持 真実', 44, 2),
(4, '風岡 渚', 60, 2),
(2, '達川 義巳', 60, 1),
(1, '水沢 舞夏', 44, 2),
(2, '板山 修平', 27, 1)
;

INSERT INTO reports (person_id, content)
-> VALUES
(14, '騎士は果たしてペットと遊ぶ'),
(3, '家族たちはかなりの数の彫刻を彫る'),
(7, '怪物が一層お笑いライブに行く'),
(11, '友達たちは一度もアイスクリームを作る'),
(9, '魔法使いは数回友達と話す'),
(16, '芸術は絶対にストリートパフォーマンスを見る'),
(8, '飛行機が次第にゲームをする'),
(2, '宇宙船がぜんぜんハイキングする'),
(1, '料理人はついに写真を現像する'),
(13, '家族はいかにもボウリングをする');

Q4
UPDATE people SET department_id=2 WHERE name='鈴木たかし';
UPDATE people SET department_id=5 WHERE name='田中ゆうこ';
UPDATE people SET department_id=4 WHERE name='福田だいすけ';
UPDATE people SET department_id=4 WHERE name='豊島はなこ';
UPDATE people SET department_id=3 WHERE name='不思議沢みちこ';

Q5
SELECT name, age, gender FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
`people`というテーブルから(FROM)
カラム名`name`, `email`, `age`を選択(SELECT)し
条件に一致するレコード`department_id`(WHERE)からid=1だけを
`created_at`の昇順で表示してください。

Q7
SELECT name FROM people WHERE gender=2 AND age BETWEEN 20 AND 29 OR gender=1 AND age BETWEEN 40 AND 49;

Q8
SELECT name, department_id, age FROM people WHERE department_id=1 ORDER BY age;

Q9
SELECT AVG(age) AS average_age FROM people GROUP BY department_id=2 AND gender=2;

Q10
SELECT p.department_name, p.name, r.content FROM people p JOIN reports r USING (person_id);

Q11
SELECT p.name, r.content FROM people p JOIN reports r USING (person_id) WHERE r.content=NULL;
