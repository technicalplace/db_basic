/* Q1 */
mysql> CREATE TABLE departments (
  -> department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -> name VARCHAR(20) NOT NULL,
  -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  -> );

/* Q2 */
mysql> ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
/* peopleテーブルにdepartment_id(物理名)カラムをINT型かつ整数値でemailカラムのあとに追加する */

/* Q3 */
`departments`
mysql> INSERT INTO departments (name)
  -> VALUES
  -> ('営業'),
  -> ('開発'),
  -> ('経理'),
  -> ('人事'),
  -> ('情報システム');

`people`
mysql> INSERT INTO people (name, email, department_id, age, gender) 
  -> VALUES 
  -> ('山田たろう', 'yamada@gizumo.jp', 1, 30, 1),
  -> ('佐藤はなこ', 'sato@gizumo.jp', 1, 26, 2),
  -> ('松田いちろう', 'matsuda@gizumo.jp', 1, 38, 1),
  -> ('高橋みさき', 'takahashi@gizumo.jp', 2, 27, 2),
  -> ('伊藤なおき', 'ito@gizumo.jp', 2, 43, 1),
  -> ('渡辺ゆみ', 'watanabe@gizumo.jp', 2, 31, 2),
  -> ('中村けんいち', 'nakamura@gizumo.jp', 2, 33, 1),
  -> ('小林なな', 'kobayashi@gizumo.jp', 3, 29, 2),
  -> ('加藤しょうた', 'kato@gizumo.jp', 4, 28, 1),
  -> ('吉田あや', 'yoshida@gizumo.jp', 5, 37, 2);

`reports`
mysql> insert into reports (person_id, content)
  -> VALUES
  -> (17, '会議資料を作成しました。'),
  -> (18, 'クライアントを訪問しました。'),
  -> (19, 'システムの更新作業を対応中です。'),
  -> (20, 'プレゼンの準備が完了しました。'),
  -> (21, '朝会で話のあったメールは返信済みです。'),
  -> (22, '新規案件に着手しました。'),
  -> (23, '部署のミーティングを実施しました。'),
  -> (24, 'トラブルの対応が完了しました。'),
  -> (25, '商品説明会に参加しました。'),
  -> (26, '営業目標を達成しました。');

/* Q4 */
mysql> UPDATE people SET department_id = 1 WHERE department_id IS NULL;

/* Q5 */
mysql> select name, age from people where gender = 1 order by age desc;

/* Q6 */
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

/* 説明：peopleテーブルに存在するname,email,ageの3つのカラムをdepartment_idが1のレコードに絞り作成日時の昇順で表示している */

/* Q7 */
/* 20代の女性と40代の男性 */
select name from people where age between 20 AND 40 && gender = 2 OR between 40 AND 50 && gender = 1;

/* Q8 */
mysql> select * from people where department_id = 1 order by age;

/* Q9 */
mysql> select AVG(age) AS average_age from people where department_id = 2 && gender = 2;

/* Q10 */
mysql> select p.name, d.name, r.content from people p join reports r using (person_id) join departments d using (department_id);

/* Q11 */
mysql> select p.name from people p left outer join reports using (person_id) where content IS NULL;