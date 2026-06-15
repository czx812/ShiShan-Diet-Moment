
-- 1. 用户表
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码（加密）',
    phone VARCHAR(20) COMMENT '手机号',
    role VARCHAR(10) DEFAULT 'user' COMMENT 'user-用户 admin-管理员',
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='用户表';

-- 2. 用户信息表
CREATE TABLE user_profile (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    age INT,
    gender VARCHAR(10),
    height DECIMAL(5,2),
    weight DECIMAL(5,2),
    target VARCHAR(50),
    activity_level VARCHAR(50),
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='用户信息表';

-- 3. 食堂表
CREATE TABLE canteen (
    canteen_id INT PRIMARY KEY AUTO_INCREMENT,
    canteen_name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='食堂表';

-- 4. 菜品分类表
CREATE TABLE dish_category (
    cate_id INT PRIMARY KEY AUTO_INCREMENT,
    cate_name VARCHAR(50) NOT NULL,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='菜品分类表';

-- 5. 菜品表
CREATE TABLE dish (
    dish_id INT PRIMARY KEY AUTO_INCREMENT,
    dish_name VARCHAR(100) NOT NULL,
    canteen_id INT,
    cate_id INT,
    calories INT,
    protein DECIMAL(5,2),
    fat DECIMAL(5,2),
    carbs DECIMAL(5,2),
    fit_target VARCHAR(50),
    dish_pic VARCHAR(255),
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='菜品表';

-- 6. 标签表
CREATE TABLE tag (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(50) NOT NULL,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='标签表';

-- 7. 菜品标签关联表
CREATE TABLE dish_tag (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dish_id INT NOT NULL,
    tag_id INT NOT NULL,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='菜品标签关联表';

-- 8. 饮食计划表
CREATE TABLE diet_plan (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    total_calories INT,
    status VARCHAR(10) DEFAULT 'active',
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='饮食计划表';

-- 9. 计划菜品关联表
CREATE TABLE plan_dish (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plan_id INT NOT NULL,
    dish_id INT NOT NULL,
    quantity INT DEFAULT 1,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='计划菜品关联表';

-- 10. 打卡记录表
CREATE TABLE clock_record (
    clock_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_id INT,
    clock_time datetime DEFAULT CURRENT_TIMESTAMP,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='打卡记录表';

-- 11. 营养统计表
CREATE TABLE nutrition_stats (
    stat_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    record_date DATE NOT NULL,
    total_calories INT DEFAULT 0,
    total_protein DECIMAL(6,2) DEFAULT 0,
    total_fat DECIMAL(6,2) DEFAULT 0,
    total_carbs DECIMAL(6,2) DEFAULT 0,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='营养统计表';

-- 12. 科普文章表
CREATE TABLE article (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='科普文章表';

-- 13. AI调用日志表
CREATE TABLE ai_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    prompt TEXT,
    response TEXT,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='AI调用日志表';

-- 14. 管理员操作日志表
CREATE TABLE admin_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_id INT NOT NULL,
    content VARCHAR(255),
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='管理员操作日志表';

-- 15. 菜品评价表
CREATE TABLE dish_comment (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    dish_id INT NOT NULL,
    user_id INT NOT NULL,
    score INT,
    content TEXT,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='菜品评价表';

-- 16. 社区帖子表
CREATE TABLE community_post (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    like_count INT DEFAULT 0,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='社区帖子表';

-- 17. 帖子评论表
CREATE TABLE post_comment (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='帖子评论表';

-- 18. 用户收藏表
CREATE TABLE user_collect (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    collect_type VARCHAR(20),
    target_id INT NOT NULL,
    create_time datetime DEFAULT CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='用户收藏表';

-- ==========================================
-- 执行完成，共 18 张表
-- ==========================================
SELECT '数据库表创建完成！共 18 张表' AS message;

-- ==========================================
-- 《狮山食刻》数据库改进脚本 - 修改现有表
-- ==========================================

USE shishan_shike;

-- 1. 用户表：添加学号字段（校园场景必需）
ALTER TABLE user
ADD COLUMN student_id VARCHAR(20) COMMENT '学号' AFTER phone;

-- 2. 用户信息表：添加忌口食材字段（文档 4.3.3.2 要求）
ALTER TABLE user_profile
ADD COLUMN taboo_foods TEXT COMMENT '忌口食材(逗号分隔)' AFTER activity_level;

-- 3. 食堂表：添加营业时间和联系电话
ALTER TABLE canteen
ADD COLUMN business_hours VARCHAR(50) COMMENT '营业时间段' AFTER location,
ADD COLUMN contact_phone VARCHAR(20) COMMENT '联系电话' AFTER business_hours;

-- 4. 菜品表：添加糖分含量和在售状态
ALTER TABLE dish
ADD COLUMN sugar DECIMAL(5,2) COMMENT '糖分(g/份)' AFTER carbs,
ADD COLUMN is_on_sale TINYINT DEFAULT 1 COMMENT '在售状态(1=在售,0=下架)' AFTER dish_pic;

-- 5. 打卡记录表：添加核心打卡字段（最重要！）
ALTER TABLE clock_record
ADD COLUMN meal_type VARCHAR(4) COMMENT '餐次(早餐/午餐/晚餐/加餐)' AFTER plan_id,
ADD COLUMN dish_list TEXT COMMENT '菜品列表(JSON格式)' AFTER meal_type,
ADD COLUMN intake_amount TEXT COMMENT '摄入分量(JSON格式)' AFTER dish_list,
ADD COLUMN remarks VARCHAR(255) COMMENT '备注' AFTER intake_amount;

-- 6. AI调用日志表：添加调试和监控字段
ALTER TABLE ai_log
ADD COLUMN model_type VARCHAR(32) COMMENT '模型类型(食谱生成/菜品推荐)' AFTER user_id,
ADD COLUMN call_status TINYINT COMMENT '调用状态(0=失败,1=成功)' AFTER response,
ADD COLUMN response_time FLOAT COMMENT '响应时长(秒)' AFTER call_status,
ADD COLUMN error_info TEXT COMMENT '错误信息' AFTER response_time;

-- 7. 饮食计划表：添加食谱内容字段
ALTER TABLE diet_plan
ADD COLUMN recipe_content TEXT COMMENT '食谱内容(JSON格式)' AFTER total_calories;

-- ==========================================
-- 修改完成
-- ==========================================
SELECT '现有表字段补充完成！' AS message;

DESC clock_record;

USE shishan_shike;

-- 1. 系统公告表（文档 F15 要求）
CREATE TABLE IF NOT EXISTS announcement (
    ann_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '公告ID',
    title VARCHAR(100) NOT NULL COMMENT '公告标题',
    content TEXT NOT NULL COMMENT '公告内容',
    admin_id INT NOT NULL COMMENT '发布人ID(关联user表)',
    is_top TINYINT DEFAULT 0 COMMENT '是否置顶(0=否,1=是)',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    is_delete TINYINT DEFAULT 0 COMMENT '逻辑删除'
) COMMENT='系统公告表';

-- 2. 食材信息表（文档 4.1 静态数据要求）
CREATE TABLE IF NOT EXISTS ingredient (
    ing_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '食材ID',
    ing_name VARCHAR(50) NOT NULL COMMENT '食材名称',
    calories_per_100g FLOAT(5,1) COMMENT '热量(kcal/100g)',
    protein_per_100g FLOAT(4,1) COMMENT '蛋白质(g/100g)',
    fat_per_100g FLOAT(4,1) COMMENT '脂肪(g/100g)',
    carbs_per_100g FLOAT(4,1) COMMENT '碳水(g/100g)',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='食材基础信息表';

-- 3. 用户反馈表（文档 7.1 验收标准要求）
CREATE TABLE IF NOT EXISTS user_feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '反馈ID',
    user_id INT NOT NULL COMMENT '用户ID',
    type VARCHAR(20) COMMENT '反馈类型(问题上报/功能建议/其他)',
    content TEXT NOT NULL COMMENT '反馈内容',
    contact VARCHAR(50) COMMENT '联系方式',
    status VARCHAR(10) DEFAULT 'pending' COMMENT '处理状态(pending/processing/resolved)',
    reply TEXT COMMENT '管理员回复',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_delete TINYINT DEFAULT 0
) COMMENT='用户反馈表';

USE shishan_shike;
ALTER TABLE canteen
ADD COLUMN business_hours VARCHAR(50) COMMENT '营业时间段' AFTER location;
ALTER TABLE canteen
ADD COLUMN contact_phone VARCHAR(20) COMMENT '联系电话' AFTER business_hours;

USE shishan_shike;
-- 桃园食堂主记录（如已存在则跳过）
INSERT INTO canteen (canteen_name, location, business_hours) VALUES
('桃园食堂', '狮山校区北区一楼', '06:30-13:00, 16:30-19:00');

-- 14家店铺
INSERT INTO canteen (canteen_name, location) VALUES
('王鼎记鸡汤粉面', '桃园一楼'),
('元朗港式烧腊饭', '桃园一楼'),
('糖水粥铺', '桃园一楼'),
('金汤鱼捞饭', '桃园一楼'),
('嗨族牛肉面', '桃园一楼'),
('面夫子', '桃园一楼'),
('黄焖鸡米饭', '桃园一楼'),
('张大嘴掉渣饼', '桃园一楼'),
('襄帅秘汁拌面', '桃园一楼'),
('东北特色', '桃园一楼'),
('大众快餐①', '桃园一楼'),
('大众快餐②', '桃园一楼'),
('韩式拌饭', '桃园一楼'),
('再麻再烫', '桃园一楼');

INSERT INTO dish_category (cate_name) VALUES
('粉面类'),
('粥品'),
('米饭套餐'),
('拌面/粉'),
('小吃'),
('饮品/糖水'),
('面点'),
('饺子'),
('炖菜'),
('麻辣烫/拌'),
('小碗菜'),
('掉渣饼');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('清汤粉/面', 2, 1, 350, 8, 5, 65, '均衡'),
('切片牛肉粉/面', 2, 1, 480, 20, 10, 70, '增肌'),
('香菇滑鸡粉/面', 2, 1, 420, 18, 8, 68, '增肌'),
('原味汤粉/面', 2, 1, 400, 10, 6, 68, '均衡'),
('腱子肉粉', 2, 1, 500, 22, 12, 72, '增肌'),
('黑椒鸡肉粉面', 2, 1, 450, 18, 9, 70, '增肌'),
('黑椒牛肉粉面', 2, 1, 480, 20, 10, 72, '增肌'),
('香菇滑肉粉面', 2, 1, 460, 16, 12, 68, '均衡'),
('玉米排骨粉面', 2, 1, 520, 18, 14, 74, '增肌'),
('瘦肉粉面', 2, 1, 480, 20, 8, 70, '增肌'),
('秘制牛腩粉面', 2, 1, 550, 22, 16, 72, '增肌'),
('萝卜牛肉粉面', 2, 1, 500, 20, 12, 70, '增肌'),
('卤鸡蛋', 2, 5, 70, 6, 5, 1, '均衡'),
('卤香干', 2, 5, 60, 6, 2, 5, '减脂'),
('蒸饺', 2, 5, 120, 5, 4, 16, '均衡'),
('地瓜丸（2个）', 2, 5, 140, 2, 5, 22, '均衡'),
('白米粥', 2, 2, 80, 2, 1, 16, '减脂'),
('瘦肉粥', 2, 2, 120, 6, 2, 18, '均衡'),
('肉沫粉粥', 2, 2, 130, 5, 3, 18, '均衡');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('蜜汁鸡腿饭', 3, 3, 550, 25, 12, 80, '增肌'),
('脆皮炸鸡翅饭', 3, 3, 600, 22, 18, 82, '均衡'),
('碳烤肉肠饭', 3, 3, 580, 20, 16, 80, '均衡'),
('金牌烧鸭饭', 3, 3, 620, 28, 20, 78, '增肌'),
('烤肉饭', 3, 3, 650, 26, 22, 76, '增肌'),
('白切鸡饭', 3, 3, 520, 24, 14, 80, '增肌'),
('蜜汁叉烧饭', 3, 3, 680, 24, 18, 84, '均衡'),
('港式双拼饭', 3, 3, 700, 30, 22, 82, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('白米粥', 4, 2, 80, 2, 1, 16, '减脂'),
('茶叶蛋', 4, 5, 70, 6, 5, 1, '均衡'),
('红薯粥', 4, 2, 120, 2, 1, 26, '减脂'),
('绿豆汤', 4, 6, 100, 5, 1, 20, '减脂'),
('酸梅汁', 4, 6, 80, 0, 0, 20, '均衡'),
('陈皮汁', 4, 6, 60, 0, 0, 15, '均衡'),
('燕麦粥', 4, 2, 150, 5, 2, 28, '减脂'),
('黑米粥', 4, 2, 140, 4, 1, 28, '减脂'),
('红豆薏仁粥', 4, 2, 130, 7, 1, 24, '减脂'),
('紫薯紫米粥', 4, 2, 150, 4, 1, 30, '减脂'),
('小米南瓜粥', 4, 2, 110, 3, 1, 22, '减脂'),
('皮蛋瘦肉粥', 4, 2, 140, 8, 3, 18, '均衡'),
('酒酿小丸子', 4, 6, 160, 4, 1, 34, '均衡'),
('冰糖炖银耳', 4, 6, 120, 1, 0, 28, '减脂'),
('酸酸乳', 4, 6, 120, 3, 2, 22, '均衡'),
('龟苓膏', 4, 6, 80, 1, 0, 18, '减脂'),
('椰奶西米露', 4, 6, 180, 2, 5, 30, '均衡'),
('豆花', 4, 6, 100, 5, 3, 12, '减脂'),
('冰粉酸梅汤', 4, 6, 90, 0, 0, 22, '减脂'),
('草莓西米粥', 4, 2, 160, 2, 2, 34, '均衡'),
('芒果西米粥', 4, 2, 160, 2, 2, 34, '均衡'),
('奇异果西米粥', 4, 2, 150, 2, 1, 34, '均衡'),
('红豆豆花', 4, 6, 140, 6, 3, 20, '均衡'),
('芋圆豆花', 4, 6, 160, 4, 3, 28, '均衡'),
('椰奶冰粉', 4, 6, 120, 1, 4, 20, '均衡'),
('招牌冰粉', 4, 6, 150, 2, 5, 24, '均衡');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('火腿豆腐捞饭', 5, 3, 420, 15, 10, 68, '均衡'),
('番茄培根捞饭', 5, 3, 480, 16, 12, 72, '均衡'),
('川味毛血旺捞饭', 5, 3, 520, 20, 18, 70, '增肌'),
('鸡块捞饭', 5, 3, 500, 22, 14, 72, '增肌'),
('肉片捞饭', 5, 3, 520, 18, 20, 70, '增肌'),
('小酥肉捞饭', 5, 3, 550, 20, 22, 72, '增肌'),
('鱼片捞饭', 5, 3, 460, 24, 10, 70, '增肌'),
('肥牛捞饭', 5, 3, 580, 26, 18, 74, '增肌'),
('黄焖鸡捞饭', 5, 3, 540, 24, 16, 72, '增肌'),
('金汤豆腐粉', 5, 1, 380, 10, 6, 70, '均衡'),
('金汤鱼头粉', 5, 1, 420, 16, 8, 70, '均衡'),
('酸菜肉片粉', 5, 1, 440, 15, 10, 72, '均衡'),
('宫保鸡丁粉', 5, 1, 460, 18, 8, 74, '增肌'),
('金汤鱼粉', 5, 1, 450, 18, 8, 72, '增肌'),
('麻辣鱼粉', 5, 1, 440, 18, 8, 72, '增肌'),
('酸菜鱼片粉', 5, 1, 460, 20, 8, 72, '增肌'),
('红烧鸡块粉', 5, 1, 480, 18, 10, 74, '增肌'),
('番茄炒蛋盖饭', 5, 3, 400, 12, 10, 68, '均衡'),
('外婆菜炒蛋盖饭', 5, 3, 420, 12, 12, 68, '均衡'),
('土豆肉片盖饭', 5, 3, 480, 16, 14, 72, '均衡'),
('青椒小滑肉盖饭', 5, 3, 500, 18, 16, 72, '增肌'),
('农家小炒肉盖饭', 5, 3, 520, 18, 18, 72, '增肌'),
('萝卜干炒腊肉盖饭', 5, 3, 540, 16, 20, 72, '均衡'),
('杭椒元宝肉盖饭', 5, 3, 560, 22, 18, 74, '增肌'),
('糖醋鸡胸排盖饭', 5, 3, 480, 24, 8, 74, '增肌'),
('可乐鸡翅盖饭', 5, 3, 550, 22, 14, 76, '增肌'),
('毛氏红烧肉盖饭', 5, 3, 620, 20, 28, 72, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('热干面', 6, 4, 400, 8, 10, 70, '均衡'),
('番茄鸡蛋面（早餐小份）', 6, 4, 300, 10, 6, 52, '均衡'),
('炸酱面', 6, 4, 450, 12, 10, 72, '均衡'),
('凉拌海带', 6, 5, 60, 2, 1, 12, '减脂'),
('正酸梅拌粉', 6, 4, 380, 6, 5, 74, '均衡'),
('肉酱拌面', 6, 4, 480, 14, 12, 74, '增肌'),
('番茄肉丝拌面', 6, 4, 450, 14, 10, 72, '均衡'),
('青椒肉丝拌面', 6, 4, 460, 14, 10, 72, '均衡'),
('番茄牛肉拌面', 6, 4, 500, 18, 12, 74, '增肌'),
('酱汁牛肉拌面', 6, 4, 520, 20, 14, 74, '增肌'),
('牛肉拌面', 6, 4, 550, 22, 16, 72, '增肌'),
('大骨清汤面/粉', 6, 1, 350, 8, 4, 68, '均衡'),
('红烧牛肉面/粉', 6, 1, 480, 18, 10, 74, '增肌'),
('重庆小面/粉', 6, 1, 420, 10, 8, 74, '均衡'),
('酸菜肉丝面/粉', 6, 1, 400, 12, 8, 70, '均衡'),
('酸豆角肉末面/粉', 6, 1, 410, 12, 8, 70, '均衡'),
('番茄肉丝面/粉', 6, 1, 420, 12, 8, 72, '均衡'),
('青椒肉丝面/粉', 6, 1, 430, 12, 8, 72, '均衡'),
('宫保鸡丁面/粉', 6, 1, 460, 16, 10, 74, '增肌'),
('番茄牛肉面/粉', 6, 1, 480, 18, 10, 74, '增肌'),
('卤丸', 6, 5, 60, 4, 3, 4, '均衡'),
('卤干子', 6, 5, 50, 5, 2, 4, '减脂'),
('卤鸡蛋', 6, 5, 70, 6, 5, 1, '均衡'),
('大鸡腿', 6, 5, 200, 18, 10, 8, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('白面馒头', 7, 7, 100, 3, 1, 20, '均衡'),
('清水馒头', 7, 7, 100, 3, 1, 20, '均衡'),
('奶香馒头', 7, 7, 120, 4, 2, 22, '均衡'),
('红糖开花馒头', 7, 7, 130, 3, 1, 28, '均衡'),
('肉沫茄子包', 7, 7, 150, 6, 5, 20, '均衡'),
('青菜香菇包', 7, 7, 120, 4, 2, 22, '减脂'),
('烧麦', 7, 7, 140, 5, 6, 18, '均衡'),
('粉丝蒸饺', 7, 7, 130, 4, 3, 22, '均衡'),
('肉包', 7, 7, 180, 8, 8, 20, '增肌'),
('梅干菜肉包', 7, 7, 170, 7, 7, 20, '均衡'),
('酸奶包', 7, 7, 150, 5, 4, 24, '均衡'),
('红豆馍', 7, 7, 140, 5, 2, 26, '均衡'),
('煎饺', 7, 5, 160, 6, 8, 18, '均衡'),
('玉米火腿肠', 7, 5, 120, 4, 5, 15, '均衡'),
('豆浆', 7, 6, 80, 6, 2, 10, '减脂'),
('牛肉包', 7, 7, 200, 10, 8, 20, '增肌'),
('红枣馒头', 7, 7, 140, 4, 1, 28, '均衡'),
('玉米棒', 7, 5, 180, 5, 2, 36, '均衡'),
('荷叶糯米鸡', 7, 5, 300, 12, 10, 40, '增肌'),
('小笼包', 7, 7, 300, 14, 12, 34, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('黄焖鸡米饭', 8, 3, 520, 22, 16, 72, '增肌'),
('土豆鸡米饭', 8, 3, 500, 20, 14, 74, '增肌'),
('粉丝鸡米饭', 8, 3, 480, 18, 12, 76, '增肌'),
('油豆腐鸡米饭', 8, 3, 490, 20, 14, 72, '增肌'),
('千张鸡米饭', 8, 3, 500, 22, 14, 72, '增肌'),
('腐竹鸡米饭', 8, 3, 510, 22, 14, 72, '增肌'),
('鸡排咖喱饭', 8, 3, 550, 20, 16, 80, '增肌'),
('培根咖喱饭', 8, 3, 520, 16, 18, 76, '均衡'),
('鸡肉里脊咖喱饭', 8, 3, 540, 22, 14, 80, '增肌'),
('香煎鸡排咖喱饭', 8, 3, 560, 22, 16, 80, '增肌'),
('滑肉片咖喱饭', 8, 3, 530, 18, 16, 78, '均衡');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('土豆片（掉渣饼加料）', 9, 12, 50, 1, 1, 10, '均衡'),
('娃娃菜（掉渣饼加料）', 9, 12, 20, 1, 0, 4, '减脂'),
('金针菇（掉渣饼加料）', 9, 12, 30, 2, 0, 5, '减脂'),
('生菜（掉渣饼加料）', 9, 12, 15, 1, 0, 3, '减脂'),
('豆皮（掉渣饼加料）', 9, 12, 50, 4, 2, 5, '减脂'),
('辣椒（掉渣饼加料）', 9, 12, 20, 1, 0, 4, '减脂'),
('鸡蛋（掉渣饼加料）', 9, 12, 70, 6, 5, 1, '均衡'),
('千页豆腐（掉渣饼加料）', 9, 12, 60, 4, 3, 5, '均衡'),
('菌菇（掉渣饼加料）', 9, 12, 40, 3, 1, 6, '减脂'),
('培根（掉渣饼加料）', 9, 12, 80, 5, 6, 2, '均衡'),
('骨肉相连（掉渣饼加料）', 9, 12, 90, 6, 5, 5, '均衡'),
('烤肠（掉渣饼加料）', 9, 12, 100, 5, 8, 3, '均衡'),
('火腿片（掉渣饼加料）', 9, 12, 80, 4, 6, 3, '均衡'),
('焦肉排（掉渣饼加料）', 9, 12, 120, 8, 9, 3, '增肌'),
('肉（掉渣饼加料）', 9, 12, 100, 8, 7, 2, '增肌'),
('雪花鸡排（掉渣饼加料）', 9, 12, 150, 10, 8, 10, '增肌'),
('藤椒鸡排', 9, 5, 200, 12, 10, 15, '增肌'),
('香酥鸡排', 9, 5, 220, 12, 12, 15, '增肌'),
('卡兹脆鸡排', 9, 5, 230, 12, 12, 16, '增肌'),
('香饼', 9, 12, 250, 6, 5, 45, '均衡'),
('掉渣饼', 9, 12, 280, 8, 8, 45, '均衡'),
('经典肉夹馍', 9, 12, 350, 12, 10, 50, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('大葱猪肉水饺', 11, 8, 280, 12, 10, 36, '均衡'),
('芹菜猪肉水饺', 11, 8, 270, 12, 9, 36, '均衡'),
('韭菜鸡蛋水饺', 11, 8, 240, 8, 8, 36, '减脂'),
('肉三鲜水饺', 11, 8, 300, 14, 12, 36, '增肌'),
('玉米猪肉水饺', 11, 8, 290, 12, 10, 38, '均衡'),
('西红柿鸡蛋水饺', 11, 8, 230, 8, 6, 36, '减脂'),
('香菇猪肉水饺', 11, 8, 280, 12, 10, 36, '均衡'),
('猪肉白菜水饺', 11, 8, 270, 11, 10, 36, '均衡'),
('酸菜猪肉水饺', 11, 8, 280, 11, 10, 36, '均衡'),
('香菇鸡肉水饺', 11, 8, 260, 14, 8, 34, '增肌'),
('牛肉水饺', 11, 8, 320, 16, 12, 36, '增肌'),
('木须肉套餐饭', 11, 3, 480, 18, 14, 72, '均衡'),
('溜肉套餐饭', 11, 3, 520, 16, 20, 68, '增肌'),
('锅包肉套餐饭', 11, 3, 550, 18, 22, 68, '增肌'),
('小鸡炖蘑菇粉条套餐', 11, 9, 520, 24, 14, 74, '增肌'),
('铁锅炖土豆排骨套餐', 11, 9, 580, 22, 20, 76, '增肌'),
('铁锅炖鱼套餐', 11, 9, 480, 26, 12, 70, '增肌'),
('铁锅炖酸菜排骨套餐', 11, 9, 540, 20, 18, 74, '增肌'),
('铁锅炖牛排骨套餐', 11, 9, 600, 28, 22, 72, '增肌'),
('鸡蛋柿子', 11, 5, 80, 4, 4, 8, '减脂');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('清炒白菜', 12, 11, 40, 2, 1, 6, '减脂'),
('清炒包菜', 12, 11, 45, 2, 1, 7, '减脂'),
('清炒豆芽', 12, 11, 35, 3, 1, 5, '减脂'),
('清炒土豆丝', 12, 11, 80, 2, 3, 12, '减脂'),
('清炒冬瓜', 12, 11, 30, 1, 0, 6, '减脂'),
('清炒南瓜', 12, 11, 50, 2, 1, 10, '减脂'),
('清炒油麦菜', 12, 11, 35, 2, 1, 5, '减脂'),
('清炒黄瓜', 12, 11, 30, 2, 1, 5, '减脂'),
('青椒土豆丝', 12, 11, 90, 3, 3, 14, '减脂'),
('青椒千张', 12, 11, 100, 8, 4, 10, '均衡'),
('清炒豆角', 12, 11, 60, 3, 2, 9, '减脂'),
('清炒西葫芦', 12, 11, 40, 2, 1, 7, '减脂'),
('青椒炒蛋', 12, 11, 120, 7, 8, 6, '均衡'),
('肉沫茄子', 12, 11, 140, 5, 10, 8, '均衡'),
('鱼香肉丝', 12, 11, 180, 10, 10, 12, '均衡'),
('宫保鸡丁', 12, 11, 200, 14, 10, 14, '增肌'),
('农家小炒肉', 12, 11, 220, 12, 16, 8, '增肌'),
('香煎豆腐', 12, 11, 150, 10, 8, 10, '均衡'),
('鱼香狮子头', 12, 11, 250, 14, 16, 12, '增肌'),
('糖醋里脊', 12, 11, 240, 14, 12, 18, '增肌'),
('回锅肉', 12, 11, 280, 12, 22, 8, '增肌'),
('红烧肉', 12, 11, 300, 10, 25, 8, '增肌'),
('黄焖鸡', 12, 11, 220, 18, 12, 10, '增肌'),
('红烧排骨', 12, 11, 260, 16, 18, 8, '增肌'),
('红烧肥肠', 12, 11, 240, 12, 18, 6, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('一荤两素套餐', 13, 3, 550, 20, 16, 80, '均衡'),
('两荤一素套餐', 13, 3, 650, 28, 22, 82, '增肌'),
('优质米饭', 13, 3, 120, 3, 0, 26, '均衡'),
('一荤一素经济套餐', 13, 3, 400, 14, 10, 62, '均衡'),
('两荤经济套餐', 13, 3, 480, 20, 16, 60, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('番茄鸡蛋拌饭', 14, 4, 450, 12, 10, 76, '均衡'),
('肉末豆角拌饭', 14, 4, 480, 14, 12, 76, '均衡'),
('卤汁腐竹拌饭', 14, 4, 420, 10, 8, 76, '均衡'),
('外婆菜拌饭', 14, 4, 440, 10, 10, 76, '均衡'),
('鸡柳拌饭', 14, 4, 500, 18, 12, 76, '增肌'),
('三色拌饭', 14, 4, 460, 12, 10, 78, '均衡'),
('蜜汁酱料拌饭', 14, 4, 480, 12, 12, 78, '均衡'),
('南京盐水鸭拌饭', 14, 4, 520, 22, 14, 76, '增肌'),
('奥尔良鸡腿拌饭', 14, 4, 540, 24, 14, 78, '增肌'),
('五香鸡块拌饭', 14, 4, 520, 22, 12, 78, '增肌'),
('黑椒肉柳拌饭', 14, 4, 560, 24, 16, 78, '增肌'),
('辣子鸡拌饭', 14, 4, 550, 24, 14, 78, '增肌'),
('糖醋鸡肉里脊拌饭', 14, 4, 540, 22, 12, 80, '增肌'),
('咖喱鸡块拌饭', 14, 4, 560, 22, 14, 80, '增肌'),
('京酱肉丝拌饭', 14, 4, 580, 20, 16, 82, '增肌'),
('青椒肉丝拌饭', 14, 4, 520, 16, 14, 80, '均衡'),
('回锅肉拌饭', 14, 4, 600, 16, 24, 78, '增肌'),
('红烧牛肉拌饭', 14, 4, 620, 26, 18, 80, '增肌');

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target) VALUES
('麻辣烫/麻辣拌（荤素自选）', 15, 10, 500, 20, 15, 70, '均衡');

SELECT COUNT(*) AS 菜品总数 FROM dish;

ALTER TABLE dish
ADD COLUMN price DECIMAL(5,1) COMMENT '价格(元)' AFTER dish_name;

UPDATE dish SET price = 6 WHERE canteen_id = 2 AND dish_name = '清汤粉/面';
UPDATE dish SET price = 9 WHERE canteen_id = 2 AND dish_name = '切片牛肉粉/面';
UPDATE dish SET price = 9 WHERE canteen_id = 2 AND dish_name = '香菇滑鸡粉/面';
UPDATE dish SET price = 8 WHERE canteen_id = 2 AND dish_name = '原味汤粉/面';
UPDATE dish SET price = 8 WHERE canteen_id = 2 AND dish_name = '腱子肉粉';
UPDATE dish SET price = 9 WHERE canteen_id = 2 AND dish_name = '黑椒鸡肉粉面';
UPDATE dish SET price = 10 WHERE canteen_id = 2 AND dish_name = '黑椒牛肉粉面';
UPDATE dish SET price = 10 WHERE canteen_id = 2 AND dish_name = '香菇滑肉粉面';
UPDATE dish SET price = 12 WHERE canteen_id = 2 AND dish_name = '玉米排骨粉面';
UPDATE dish SET price = 12 WHERE canteen_id = 2 AND dish_name = '瘦肉粉面';
UPDATE dish SET price = 12 WHERE canteen_id = 2 AND dish_name = '秘制牛腩粉面';
UPDATE dish SET price = 14 WHERE canteen_id = 2 AND dish_name = '萝卜牛肉粉面';
UPDATE dish SET price = 1 WHERE canteen_id = 2 AND dish_name = '卤鸡蛋';
UPDATE dish SET price = 1 WHERE canteen_id = 2 AND dish_name = '卤香干';
UPDATE dish SET price = 2 WHERE canteen_id = 2 AND dish_name = '蒸饺';
UPDATE dish SET price = 2 WHERE canteen_id = 2 AND dish_name = '地瓜丸（2个）';
UPDATE dish SET price = 1 WHERE canteen_id = 2 AND dish_name = '白米粥';
UPDATE dish SET price = 1.5 WHERE canteen_id = 2 AND dish_name = '瘦肉粥';
UPDATE dish SET price = 2 WHERE canteen_id = 2 AND dish_name = '肉沫粉粥';

UPDATE dish SET price = 12 WHERE canteen_id = 3 AND dish_name = '蜜汁鸡腿饭';
UPDATE dish SET price = 12 WHERE canteen_id = 3 AND dish_name = '脆皮炸鸡翅饭';
UPDATE dish SET price = 12 WHERE canteen_id = 3 AND dish_name = '碳烤肉肠饭';
UPDATE dish SET price = 13 WHERE canteen_id = 3 AND dish_name = '金牌烧鸭饭';
UPDATE dish SET price = 13 WHERE canteen_id = 3 AND dish_name = '烤肉饭';
UPDATE dish SET price = 13 WHERE canteen_id = 3 AND dish_name = '白切鸡饭';
UPDATE dish SET price = 14 WHERE canteen_id = 3 AND dish_name = '蜜汁叉烧饭';
UPDATE dish SET price = 15 WHERE canteen_id = 3 AND dish_name = '港式双拼饭';

UPDATE dish SET price = 1 WHERE canteen_id = 4 AND dish_name = '白米粥';
UPDATE dish SET price = 1 WHERE canteen_id = 4 AND dish_name = '茶叶蛋';
UPDATE dish SET price = 2 WHERE canteen_id = 4 AND dish_name = '红薯粥';
UPDATE dish SET price = 2 WHERE canteen_id = 4 AND dish_name = '绿豆汤';
UPDATE dish SET price = 2.5 WHERE canteen_id = 4 AND dish_name = '酸梅汁';
UPDATE dish SET price = 2.5 WHERE canteen_id = 4 AND dish_name = '陈皮汁';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '燕麦粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '黑米粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '红豆薏仁粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '紫薯紫米粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '小米南瓜粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '皮蛋瘦肉粥';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '酒酿小丸子';
UPDATE dish SET price = 3 WHERE canteen_id = 4 AND dish_name = '冰糖炖银耳';
UPDATE dish SET price = 4 WHERE canteen_id = 4 AND dish_name = '酸酸乳';
UPDATE dish SET price = 4 WHERE canteen_id = 4 AND dish_name = '龟苓膏';
UPDATE dish SET price = 4 WHERE canteen_id = 4 AND dish_name = '椰奶西米露';
UPDATE dish SET price = 4 WHERE canteen_id = 4 AND dish_name = '豆花';
UPDATE dish SET price = 4 WHERE canteen_id = 4 AND dish_name = '冰粉酸梅汤';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '草莓西米粥';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '芒果西米粥';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '奇异果西米粥';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '红豆豆花';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '芋圆豆花';
UPDATE dish SET price = 5 WHERE canteen_id = 4 AND dish_name = '椰奶冰粉';
UPDATE dish SET price = 6 WHERE canteen_id = 4 AND dish_name = '招牌冰粉';

UPDATE dish SET price = 10 WHERE canteen_id = 5 AND dish_name = '火腿豆腐捞饭';
UPDATE dish SET price = 11 WHERE canteen_id = 5 AND dish_name = '番茄培根捞饭';
UPDATE dish SET price = 11 WHERE canteen_id = 5 AND dish_name = '川味毛血旺捞饭';
UPDATE dish SET price = 12 WHERE canteen_id = 5 AND dish_name = '鸡块捞饭';
UPDATE dish SET price = 13 WHERE canteen_id = 5 AND dish_name = '肉片捞饭';
UPDATE dish SET price = 13 WHERE canteen_id = 5 AND dish_name = '小酥肉捞饭';
UPDATE dish SET price = 14 WHERE canteen_id = 5 AND dish_name = '鱼片捞饭';
UPDATE dish SET price = 15 WHERE canteen_id = 5 AND dish_name = '肥牛捞饭';
UPDATE dish SET price = 14 WHERE canteen_id = 5 AND dish_name = '黄焖鸡捞饭';
UPDATE dish SET price = 8 WHERE canteen_id = 5 AND dish_name = '金汤豆腐粉';
UPDATE dish SET price = 9 WHERE canteen_id = 5 AND dish_name = '金汤鱼头粉';
UPDATE dish SET price = 9 WHERE canteen_id = 5 AND dish_name = '酸菜肉片粉';
UPDATE dish SET price = 9 WHERE canteen_id = 5 AND dish_name = '宫保鸡丁粉';
UPDATE dish SET price = 10 WHERE canteen_id = 5 AND dish_name = '金汤鱼粉';
UPDATE dish SET price = 10 WHERE canteen_id = 5 AND dish_name = '麻辣鱼粉';
UPDATE dish SET price = 12 WHERE canteen_id = 5 AND dish_name = '酸菜鱼片粉';
UPDATE dish SET price = 10 WHERE canteen_id = 5 AND dish_name = '红烧鸡块粉';
UPDATE dish SET price = 9 WHERE canteen_id = 5 AND dish_name = '番茄炒蛋盖饭';
UPDATE dish SET price = 11 WHERE canteen_id = 5 AND dish_name = '外婆菜炒蛋盖饭';
UPDATE dish SET price = 12 WHERE canteen_id = 5 AND dish_name = '土豆肉片盖饭';
UPDATE dish SET price = 12 WHERE canteen_id = 5 AND dish_name = '青椒小滑肉盖饭';
UPDATE dish SET price = 13 WHERE canteen_id = 5 AND dish_name = '农家小炒肉盖饭';
UPDATE dish SET price = 13 WHERE canteen_id = 5 AND dish_name = '萝卜干炒腊肉盖饭';
UPDATE dish SET price = 14 WHERE canteen_id = 5 AND dish_name = '杭椒元宝肉盖饭';
UPDATE dish SET price = 14 WHERE canteen_id = 5 AND dish_name = '糖醋鸡胸排盖饭';
UPDATE dish SET price = 15 WHERE canteen_id = 5 AND dish_name = '可乐鸡翅盖饭';
UPDATE dish SET price = 16 WHERE canteen_id = 5 AND dish_name = '毛氏红烧肉盖饭';

UPDATE dish SET price = 4 WHERE canteen_id = 6 AND dish_name = '热干面';
UPDATE dish SET price = 4 WHERE canteen_id = 6 AND dish_name = '番茄鸡蛋面（早餐小份）';
UPDATE dish SET price = 5 WHERE canteen_id = 6 AND dish_name = '炸酱面';
UPDATE dish SET price = 6 WHERE canteen_id = 6 AND dish_name = '凉拌海带';
UPDATE dish SET price = 7 WHERE canteen_id = 6 AND dish_name = '正酸梅拌粉';
UPDATE dish SET price = 10 WHERE canteen_id = 6 AND dish_name = '肉酱拌面';
UPDATE dish SET price = 10 WHERE canteen_id = 6 AND dish_name = '番茄肉丝拌面';
UPDATE dish SET price = 10 WHERE canteen_id = 6 AND dish_name = '青椒肉丝拌面';
UPDATE dish SET price = 12 WHERE canteen_id = 6 AND dish_name = '番茄牛肉拌面';
UPDATE dish SET price = 12 WHERE canteen_id = 6 AND dish_name = '酱汁牛肉拌面';
UPDATE dish SET price = 13 WHERE canteen_id = 6 AND dish_name = '牛肉拌面';
UPDATE dish SET price = 6 WHERE canteen_id = 6 AND dish_name = '大骨清汤面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 6 AND dish_name = '红烧牛肉面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 6 AND dish_name = '重庆小面/粉';
UPDATE dish SET price = 8 WHERE canteen_id = 6 AND dish_name = '酸菜肉丝面/粉';
UPDATE dish SET price = 8 WHERE canteen_id = 6 AND dish_name = '酸豆角肉末面/粉';
UPDATE dish SET price = 10 WHERE canteen_id = 6 AND dish_name = '番茄肉丝面/粉';
UPDATE dish SET price = 10 WHERE canteen_id = 6 AND dish_name = '青椒肉丝面/粉';
UPDATE dish SET price = 11 WHERE canteen_id = 6 AND dish_name = '宫保鸡丁面/粉';
UPDATE dish SET price = 11 WHERE canteen_id = 6 AND dish_name = '番茄牛肉面/粉';
UPDATE dish SET price = 1 WHERE canteen_id = 6 AND dish_name = '卤丸';
UPDATE dish SET price = 1 WHERE canteen_id = 6 AND dish_name = '卤干子';
UPDATE dish SET price = 1.5 WHERE canteen_id = 6 AND dish_name = '卤鸡蛋';
UPDATE dish SET price = 5 WHERE canteen_id = 6 AND dish_name = '大鸡腿';

UPDATE dish SET price = 12 WHERE canteen_id = 8 AND dish_name = '黄焖鸡米饭';
UPDATE dish SET price = 12 WHERE canteen_id = 8 AND dish_name = '土豆鸡米饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '粉丝鸡米饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '油豆腐鸡米饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '千张鸡米饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '腐竹鸡米饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '鸡排咖喱饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '培根咖喱饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '鸡肉里脊咖喱饭';
UPDATE dish SET price = 13 WHERE canteen_id = 8 AND dish_name = '香煎鸡排咖喱饭';
UPDATE dish SET price = 14 WHERE canteen_id = 8 AND dish_name = '滑肉片咖喱饭';

UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '土豆片（掉渣饼加料）';
UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '娃娃菜（掉渣饼加料）';
UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '金针菇（掉渣饼加料）';
UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '生菜（掉渣饼加料）';
UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '豆皮（掉渣饼加料）';
UPDATE dish SET price = 1 WHERE canteen_id = 9 AND dish_name = '辣椒（掉渣饼加料）';
UPDATE dish SET price = 1.5 WHERE canteen_id = 9 AND dish_name = '鸡蛋（掉渣饼加料）';
UPDATE dish SET price = 2 WHERE canteen_id = 9 AND dish_name = '千页豆腐（掉渣饼加料）';
UPDATE dish SET price = 2 WHERE canteen_id = 9 AND dish_name = '菌菇（掉渣饼加料）';
UPDATE dish SET price = 2 WHERE canteen_id = 9 AND dish_name = '培根（掉渣饼加料）';
UPDATE dish SET price = 2 WHERE canteen_id = 9 AND dish_name = '骨肉相连（掉渣饼加料）';
UPDATE dish SET price = 2 WHERE canteen_id = 9 AND dish_name = '烤肠（掉渣饼加料）';
UPDATE dish SET price = 2.5 WHERE canteen_id = 9 AND dish_name = '火腿片（掉渣饼加料）';
UPDATE dish SET price = 3 WHERE canteen_id = 9 AND dish_name = '焦肉排（掉渣饼加料）';
UPDATE dish SET price = 3 WHERE canteen_id = 9 AND dish_name = '肉（掉渣饼加料）';
UPDATE dish SET price = 5 WHERE canteen_id = 9 AND dish_name = '雪花鸡排（掉渣饼加料）';
UPDATE dish SET price = 6 WHERE canteen_id = 9 AND dish_name = '藤椒鸡排';
UPDATE dish SET price = 6 WHERE canteen_id = 9 AND dish_name = '香酥鸡排';
UPDATE dish SET price = 6 WHERE canteen_id = 9 AND dish_name = '卡兹脆鸡排';
UPDATE dish SET price = 3 WHERE canteen_id = 9 AND dish_name = '香饼';
UPDATE dish SET price = 3.5 WHERE canteen_id = 9 AND dish_name = '掉渣饼';
UPDATE dish SET price = 7 WHERE canteen_id = 9 AND dish_name = '经典肉夹馍';

UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '麻酱拌面/粉';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '剁椒拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '杂酱拌面/粉（可加臊子）';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '番茄鸡蛋拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '土豆肉酱拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '茄子肉酱拌面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '孜然牛肉拌面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '肉沫茄子拌面/粉';
UPDATE dish SET price = 10 WHERE canteen_id = 10 AND dish_name = '五香鸡柳拌粉/面';
UPDATE dish SET price = 11 WHERE canteen_id = 10 AND dish_name = '韩式炸鸡拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '辣椒小炒拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '健康鸡扒拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '奥尔良鸡肉拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '台式卤肉拌粉/面';
UPDATE dish SET price = 13 WHERE canteen_id = 10 AND dish_name = '黑椒肉排拌粉/面';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '大骨高汤素粉/面';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '大刀红油素粉/面';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '刀削面（清汤/红油）';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '西红柿鸡蛋面/粉';
UPDATE dish SET price = 13 WHERE canteen_id = 10 AND dish_name = '红烧牛肉汤粉/面';
UPDATE dish SET price = 0.5 WHERE canteen_id = 10 AND dish_name = '卤豆干';
UPDATE dish SET price = 1 WHERE canteen_id = 10 AND dish_name = '卤千张';
UPDATE dish SET price = 1.5 WHERE canteen_id = 10 AND dish_name = '卤蛋';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '卤鸡腿';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '卤鸭腿';

UPDATE dish SET price = 4 WHERE canteen_id = 11 AND dish_name = '大葱猪肉水饺';
UPDATE dish SET price = 4 WHERE canteen_id = 11 AND dish_name = '芹菜猪肉水饺';
UPDATE dish SET price = 4 WHERE canteen_id = 11 AND dish_name = '韭菜鸡蛋水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '肉三鲜水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '玉米猪肉水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '西红柿鸡蛋水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '香菇猪肉水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '猪肉白菜水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '酸菜猪肉水饺';
UPDATE dish SET price = 5 WHERE canteen_id = 11 AND dish_name = '香菇鸡肉水饺';
UPDATE dish SET price = 6 WHERE canteen_id = 11 AND dish_name = '牛肉水饺';
UPDATE dish SET price = 10 WHERE canteen_id = 11 AND dish_name = '木须肉套餐饭';
UPDATE dish SET price = 12 WHERE canteen_id = 11 AND dish_name = '溜肉套餐饭';
UPDATE dish SET price = 13 WHERE canteen_id = 11 AND dish_name = '锅包肉套餐饭';
UPDATE dish SET price = 13 WHERE canteen_id = 11 AND dish_name = '小鸡炖蘑菇粉条套餐';
UPDATE dish SET price = 13 WHERE canteen_id = 11 AND dish_name = '铁锅炖土豆排骨套餐';
UPDATE dish SET price = 13 WHERE canteen_id = 11 AND dish_name = '铁锅炖鱼套餐';
UPDATE dish SET price = 14 WHERE canteen_id = 11 AND dish_name = '铁锅炖酸菜排骨套餐';
UPDATE dish SET price = 15 WHERE canteen_id = 11 AND dish_name = '铁锅炖牛排骨套餐';
UPDATE dish SET price = 2 WHERE canteen_id = 11 AND dish_name = '鸡蛋柿子';

UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒白菜';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒包菜';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒豆芽';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒土豆丝';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒冬瓜';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒南瓜';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒油麦菜';
UPDATE dish SET price = 2 WHERE canteen_id = 12 AND dish_name = '清炒黄瓜';
UPDATE dish SET price = 3 WHERE canteen_id = 12 AND dish_name = '青椒土豆丝';
UPDATE dish SET price = 3 WHERE canteen_id = 12 AND dish_name = '青椒千张';
UPDATE dish SET price = 3 WHERE canteen_id = 12 AND dish_name = '清炒豆角';
UPDATE dish SET price = 3 WHERE canteen_id = 12 AND dish_name = '清炒西葫芦';
UPDATE dish SET price = 4 WHERE canteen_id = 12 AND dish_name = '青椒炒蛋';
UPDATE dish SET price = 4 WHERE canteen_id = 12 AND dish_name = '肉沫茄子';
UPDATE dish SET price = 6 WHERE canteen_id = 12 AND dish_name = '鱼香肉丝';
UPDATE dish SET price = 6 WHERE canteen_id = 12 AND dish_name = '宫保鸡丁';
UPDATE dish SET price = 6 WHERE canteen_id = 12 AND dish_name = '农家小炒肉';
UPDATE dish SET price = 6 WHERE canteen_id = 12 AND dish_name = '香煎豆腐';
UPDATE dish SET price = 7 WHERE canteen_id = 12 AND dish_name = '鱼香狮子头';
UPDATE dish SET price = 7 WHERE canteen_id = 12 AND dish_name = '糖醋里脊';
UPDATE dish SET price = 7 WHERE canteen_id = 12 AND dish_name = '回锅肉';
UPDATE dish SET price = 8 WHERE canteen_id = 12 AND dish_name = '红烧肉';
UPDATE dish SET price = 8 WHERE canteen_id = 12 AND dish_name = '黄焖鸡';
UPDATE dish SET price = 8 WHERE canteen_id = 12 AND dish_name = '红烧排骨';
UPDATE dish SET price = 8 WHERE canteen_id = 12 AND dish_name = '红烧肥肠';

UPDATE dish SET price = 8 WHERE canteen_id = 13 AND dish_name = '一荤两素套餐';
UPDATE dish SET price = 10 WHERE canteen_id = 13 AND dish_name = '两荤一素套餐';
UPDATE dish SET price = 0.3 WHERE canteen_id = 13 AND dish_name = '优质米饭';
UPDATE dish SET price = 3 WHERE canteen_id = 13 AND dish_name = '一荤一素经济套餐';
UPDATE dish SET price = 3.5 WHERE canteen_id = 13 AND dish_name = '两荤经济套餐';

UPDATE dish SET price = 11 WHERE canteen_id = 14 AND dish_name = '番茄鸡蛋拌饭';
UPDATE dish SET price = 11 WHERE canteen_id = 14 AND dish_name = '肉末豆角拌饭';
UPDATE dish SET price = 11 WHERE canteen_id = 14 AND dish_name = '卤汁腐竹拌饭';
UPDATE dish SET price = 11 WHERE canteen_id = 14 AND dish_name = '外婆菜拌饭';
UPDATE dish SET price = 12 WHERE canteen_id = 14 AND dish_name = '鸡柳拌饭';
UPDATE dish SET price = 12 WHERE canteen_id = 14 AND dish_name = '三色拌饭';
UPDATE dish SET price = 12 WHERE canteen_id = 14 AND dish_name = '蜜汁酱料拌饭';
UPDATE dish SET price = 12 WHERE canteen_id = 14 AND dish_name = '南京盐水鸭拌饭';
UPDATE dish SET price = 13 WHERE canteen_id = 14 AND dish_name = '奥尔良鸡腿拌饭';
UPDATE dish SET price = 13 WHERE canteen_id = 14 AND dish_name = '五香鸡块拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '黑椒肉柳拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '辣子鸡拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '糖醋鸡肉里脊拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '咖喱鸡块拌饭';
UPDATE dish SET price = 14 WHERE canteen_id = 14 AND dish_name = '京酱肉丝拌饭';
UPDATE dish SET price = 14 WHERE canteen_id = 14 AND dish_name = '青椒肉丝拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '回锅肉拌饭';
UPDATE dish SET price = 15 WHERE canteen_id = 14 AND dish_name = '红烧牛肉拌饭';

UPDATE dish SET price = 1.78 WHERE canteen_id = 15 AND dish_name = '麻辣烫/麻辣拌（荤素自选）';

SELECT canteen_id, dish_name, price FROM dish ORDER BY canteen_id, dish_id;
SELECT canteen_id, dish_name, price FROM dish WHERE canteen_id >= 7 ORDER BY canteen_id, dish_id;

UPDATE dish SET price = 0.6 WHERE canteen_id = 7 AND dish_name = '白面馒头';
UPDATE dish SET price = 0.7 WHERE canteen_id = 7 AND dish_name = '清水馒头';
UPDATE dish SET price = 1 WHERE canteen_id = 7 AND dish_name = '奶香馒头';
UPDATE dish SET price = 1 WHERE canteen_id = 7 AND dish_name = '红糖开花馒头';
UPDATE dish SET price = 1.5 WHERE canteen_id = 7 AND dish_name = '肉沫茄子包';
UPDATE dish SET price = 1.5 WHERE canteen_id = 7 AND dish_name = '青菜香菇包';
UPDATE dish SET price = 1.5 WHERE canteen_id = 7 AND dish_name = '烧麦';
UPDATE dish SET price = 1.5 WHERE canteen_id = 7 AND dish_name = '粉丝蒸饺';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '肉包';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '酸奶包';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '红豆馍';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '煎饺';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '玉米火腿肠';
UPDATE dish SET price = 2 WHERE canteen_id = 7 AND dish_name = '豆浆';
UPDATE dish SET price = 2.5 WHERE canteen_id = 7 AND dish_name = '牛肉包';
UPDATE dish SET price = 2.5 WHERE canteen_id = 7 AND dish_name = '梅干菜肉包';
UPDATE dish SET price = 2.5 WHERE canteen_id = 7 AND dish_name = '红枣馒头';
UPDATE dish SET price = 4 WHERE canteen_id = 7 AND dish_name = '玉米棒';
UPDATE dish SET price = 4.5 WHERE canteen_id = 7 AND dish_name = '荷叶糯米鸡';
UPDATE dish SET price = 5 WHERE canteen_id = 7 AND dish_name = '小笼包';

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price)
VALUES ('梅干菜肉包（小）', 7, 7, 150, 6, 6, 18, '均衡', 2);

SELECT canteen_id, dish_name, price FROM dish WHERE canteen_id >= 13 ORDER BY canteen_id, dish_id;

ALTER TABLE dish
MODIFY COLUMN price DECIMAL(5,2) COMMENT '价格(元)';
UPDATE dish SET price = 1.78 WHERE canteen_id = 15;

SELECT dish_id FROM dish WHERE canteen_id = 15;
DELETE FROM dish WHERE dish_id = 227;
ALTER TABLE dish MODIFY COLUMN price DECIMAL(5,2) COMMENT '价格(元)';
UPDATE dish SET price = 1.78 WHERE canteen_id = 15;
SELECT canteen_id, dish_name, price FROM dish WHERE canteen_id = 10;

UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '麻酱拌面/粉';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '剁椒拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '杂酱拌面/粉（可加臊子）';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '番茄鸡蛋拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '土豆肉酱拌面/粉';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '茄子肉酱拌面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '孜然牛肉拌面/粉';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '肉沫茄子拌面/粉';
UPDATE dish SET price = 10 WHERE canteen_id = 10 AND dish_name = '五香鸡柳拌粉/面';
UPDATE dish SET price = 11 WHERE canteen_id = 10 AND dish_name = '韩式炸鸡拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '辣椒小炒拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '健康鸡扒拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '奥尔良鸡肉拌粉/面';
UPDATE dish SET price = 12 WHERE canteen_id = 10 AND dish_name = '台式卤肉拌粉/面';
UPDATE dish SET price = 13 WHERE canteen_id = 10 AND dish_name = '黑椒肉排拌粉/面';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '大骨高汤素粉/面';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '大刀红油素粉/面';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '刀削面（清汤/红油）';
UPDATE dish SET price = 7 WHERE canteen_id = 10 AND dish_name = '西红柿鸡蛋面/粉';
UPDATE dish SET price = 13 WHERE canteen_id = 10 AND dish_name = '红烧牛肉汤粉/面';
UPDATE dish SET price = 0.5 WHERE canteen_id = 10 AND dish_name = '卤豆干';
UPDATE dish SET price = 1 WHERE canteen_id = 10 AND dish_name = '卤千张';
UPDATE dish SET price = 1.5 WHERE canteen_id = 10 AND dish_name = '卤蛋';
UPDATE dish SET price = 5 WHERE canteen_id = 10 AND dish_name = '卤鸡腿';
UPDATE dish SET price = 6 WHERE canteen_id = 10 AND dish_name = '卤鸭腿';

SELECT canteen_id, dish_name, price FROM dish ORDER BY canteen_id, dish_id;
SELECT canteen_id, dish_name, price FROM dish WHERE canteen_id >= 7 ORDER BY canteen_id, dish_id;

INSERT INTO canteen (canteen_name, location, business_hours) VALUES
('桃园食堂二楼', '狮山校区北区二楼', '06:30-13:00, 16:30-19:00');

INSERT INTO canteen (canteen_name, location) VALUES
('老面手工包', '桃园二楼'),
('简单人', '桃园二楼'),
('瓦香鸡米饭', '桃园二楼'),
('龙须拉面', '桃园二楼'),
('长沙码子粉', '桃园二楼'),
('土豆泥拌饭', '桃园二楼'),
('精品套餐', '桃园二楼'),
('鲍汁肥牛饭', '桃园二楼'),
('绝味小笼包', '桃园二楼'),
('干锅老卤', '桃园二楼'),
('大众快餐', '桃园二楼'),
('牛肉饭', '桃园二楼'),
('桃二水吧', '桃园二楼');

SELECT canteen_id, canteen_name FROM canteen WHERE location LIKE '%桃园二楼%' ORDER BY canteen_id;
SELECT cate_id, cate_name FROM dish_category ORDER BY cate_id;
INSERT INTO dish_category (cate_name) VALUES
('炒饭/粉/面'),
('油炸'),
('馄饨/水饺'),
('干锅/煲');
SELECT cate_id, cate_name FROM dish_category ORDER BY cate_id;

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('红薯馒头', 17, 7, 120, 4, 1, 24, '均衡', 1),
('紫薯馒头', 17, 7, 120, 4, 1, 24, '均衡', 1),
('葱油花卷', 17, 7, 130, 5, 3, 22, '均衡', 1),
('肉末烧麦', 17, 7, 140, 5, 6, 18, '均衡', 1),
('红豆包', 17, 7, 150, 5, 2, 28, '均衡', 1),
('酱肉包', 17, 7, 180, 8, 8, 20, '增肌', 1.5),
('香辣雪菜包', 17, 7, 130, 4, 3, 22, '均衡', 1.5),
('苕粉肉末包', 17, 7, 160, 6, 5, 22, '均衡', 1.5),
('香菇青菜包', 17, 7, 120, 4, 2, 22, '减脂', 1.5),
('红糖方糕', 17, 7, 160, 3, 2, 32, '均衡', 1.8),
('桂花发糕', 17, 7, 150, 3, 2, 30, '均衡', 2),
('龙口粉丝包', 17, 7, 140, 4, 3, 24, '均衡', 2),
('鸡汁鲜肉包', 17, 7, 190, 10, 8, 20, '增肌', 2),
('红萝卜牛肉包', 17, 7, 200, 12, 8, 20, '增肌', 2.5),
('东北糯玉米', 17, 5, 180, 5, 2, 36, '均衡', 3),
('香甜玉米', 17, 5, 160, 4, 2, 32, '均衡', 4),
('蒸紫薯', 17, 5, 80, 2, 0, 18, '减脂', 10),
('烤蜜薯', 17, 5, 90, 2, 0, 20, '减脂', 10),
('白水蛋', 17, 5, 60, 5, 4, 1, '均衡', 0.7),
('卤鸡蛋', 17, 5, 70, 6, 5, 1, '均衡', 1),
('蛋花米酒', 17, 2, 100, 3, 2, 18, '均衡', 2),
('南瓜小米粥', 17, 2, 110, 3, 1, 22, '减脂', 2),
('紫米粥', 17, 2, 120, 4, 1, 24, '减脂', 2),
('豆腐脑', 17, 2, 80, 5, 3, 8, '减脂', 2),
('冰镇米酒', 17, 6, 90, 2, 0, 20, '均衡', 2),
('桂花米酒汤圆', 17, 6, 150, 4, 2, 30, '均衡', 3);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('培根炒饭/粉/面', 18, 13, 520, 16, 14, 78, '均衡', 11),
('菠萝炒饭/粉/面', 18, 13, 480, 12, 10, 80, '均衡', 12),
('鸡排炒饭/粉/面', 18, 13, 550, 20, 14, 80, '增肌', 12),
('肉丝炒饭/粉/面', 18, 13, 500, 16, 12, 78, '均衡', 12),
('卤肉炒饭/粉/面', 18, 13, 540, 16, 16, 78, '增肌', 13),
('小鱼炒饭/粉/面', 18, 13, 480, 18, 10, 76, '增肌', 13),
('脆骨炒饭/粉/面', 18, 13, 520, 18, 14, 78, '增肌', 13),
('烤肠炒饭/粉/面', 18, 13, 530, 14, 16, 78, '均衡', 13),
('牛肉炒饭/粉/面', 18, 13, 560, 22, 14, 80, '增肌', 14),
('鸡蛋软饼', 18, 7, 120, 5, 4, 18, '均衡', 2),
('土豆丝卷饼夹肠', 18, 7, 200, 8, 8, 24, '均衡', 3),
('土豆丝卷饼夹鸡柳', 18, 7, 220, 10, 8, 26, '均衡', 3.5),
('手抓饼夹鸡蛋+鸡柳', 18, 7, 350, 14, 14, 40, '增肌', 6.5),
('手抓饼夹鸡蛋+肠', 18, 7, 320, 12, 12, 40, '均衡', 6),
('苕面窝', 18, 14, 120, 2, 5, 18, '均衡', 1.5),
('油香', 18, 14, 130, 3, 6, 16, '均衡', 1.5),
('大油条', 18, 14, 180, 5, 8, 22, '均衡', 1.5),
('大麻圆', 18, 14, 150, 4, 5, 22, '均衡', 1.5),
('糯米鸡', 18, 14, 200, 8, 8, 24, '均衡', 1.5),
('鸡冠饺', 18, 14, 160, 6, 7, 18, '均衡', 1.5),
('香酥鸡翅根', 18, 14, 180, 10, 10, 12, '增肌', 2.5),
('肉馅饼', 18, 7, 250, 10, 12, 26, '均衡', 3),
('太阳饼', 18, 7, 230, 8, 10, 28, '均衡', 3),
('小馄饨（份）', 18, 15, 200, 8, 5, 30, '均衡', 4),
('小馄饨（大碗）', 18, 15, 400, 16, 10, 60, '均衡', 8),
('沙县馄饨（份）', 18, 15, 220, 10, 6, 30, '均衡', 5),
('沙县馄饨（大碗）', 18, 15, 440, 20, 12, 60, '增肌', 10),
('荠菜猪肉水饺', 18, 8, 280, 12, 10, 36, '均衡', 5),
('香菇猪肉水饺', 18, 8, 280, 12, 10, 36, '均衡', 5),
('白菜猪肉水饺', 18, 8, 270, 11, 10, 36, '均衡', 5),
('韭菜猪肉水饺', 18, 8, 280, 12, 10, 36, '均衡', 5);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('瓦香香肠千叶豆腐', 19, 16, 420, 14, 12, 64, '均衡', 10),
('瓦香孜然土豆片', 19, 16, 380, 8, 10, 64, '均衡', 10),
('瓦香宫保鸡丁', 19, 16, 460, 20, 12, 66, '增肌', 11),
('瓦香火腿肠鸡蛋', 19, 16, 440, 16, 14, 64, '均衡', 12),
('招牌瓦香鸡', 19, 16, 520, 24, 16, 68, '增肌', 12),
('瓦香五花肉炒香干', 19, 16, 540, 20, 20, 66, '增肌', 12),
('瓦香五花肉炒腐竹', 19, 16, 530, 20, 18, 68, '增肌', 12),
('瓦香培根', 19, 16, 500, 16, 18, 66, '均衡', 12),
('瓦香脆皮肠', 19, 16, 480, 14, 16, 68, '均衡', 12),
('瓦香五花肉炒茄子', 19, 16, 520, 18, 20, 66, '增肌', 12),
('瓦香五花肉炒有机花菜', 19, 16, 500, 18, 18, 66, '增肌', 12),
('瓦香蒙古肉', 19, 16, 560, 24, 18, 68, '增肌', 13),
('瓦香涮肉片', 19, 16, 540, 22, 18, 68, '增肌', 13),
('瓦香小酥肉', 19, 16, 560, 22, 22, 68, '增肌', 13);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('西红柿鸡蛋拌面', 20, 4, 400, 10, 8, 72, '均衡', 6),
('肉沫拌面', 20, 4, 440, 12, 10, 74, '均衡', 8),
('西红柿牛腩拌面', 20, 4, 480, 18, 12, 74, '增肌', 9),
('大盘鸡拌面', 20, 4, 520, 22, 14, 74, '增肌', 10),
('番茄鸡蛋拉面', 20, 1, 380, 10, 6, 70, '均衡', 6),
('香辣鸡块拉面', 20, 1, 420, 16, 8, 70, '增肌', 7),
('榨菜肉丝拉面', 20, 1, 400, 12, 8, 70, '均衡', 7),
('鸭肠拉面', 20, 1, 420, 14, 10, 68, '均衡', 8),
('番茄牛腩拉面', 20, 1, 460, 18, 12, 70, '增肌', 9),
('牛肉拉面', 20, 1, 480, 20, 12, 72, '增肌', 9),
('肥肠酸菜拉面', 20, 1, 500, 16, 16, 72, '均衡', 10),
('羊肉拉面', 20, 1, 520, 22, 14, 72, '增肌', 12),
('鸡块手工宽面', 20, 1, 430, 16, 8, 72, '增肌', 7.5),
('鸭肠手工宽面', 20, 1, 430, 14, 10, 70, '均衡', 8.5),
('番茄牛腩手工宽面', 20, 1, 470, 18, 12, 72, '增肌', 9.5),
('牛肉手工宽面', 20, 1, 490, 20, 12, 74, '增肌', 9.5),
('卤鸡蛋', 20, 5, 70, 6, 5, 1, '均衡', 1),
('卤干子', 20, 5, 50, 5, 2, 4, '减脂', 1),
('加青菜', 20, 5, 15, 1, 0, 3, '减脂', 1);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('茄汁粉/面', 21, 1, 350, 8, 4, 68, '均衡', 5),
('酸辣粉/面', 21, 1, 340, 6, 4, 68, '均衡', 5),
('重庆小面', 21, 1, 380, 8, 5, 72, '均衡', 6),
('沙县粉/面', 21, 1, 360, 8, 4, 70, '均衡', 6),
('原汤码子粉/面', 21, 1, 370, 10, 5, 70, '均衡', 6),
('豆腐海带粉/面', 21, 1, 340, 10, 4, 66, '减脂', 6),
('豌杂粉/面', 21, 1, 420, 14, 8, 72, '均衡', 9),
('香卤拌粉/面', 21, 4, 420, 10, 8, 74, '均衡', 9),
('炸酱码子粉/面', 21, 4, 450, 12, 10, 74, '均衡', 10),
('小炒肉拌粉/面', 21, 4, 480, 16, 12, 74, '增肌', 11),
('鸡丁香卤拌粉/面', 21, 4, 460, 18, 10, 72, '增肌', 12),
('卤肉香卤拌粉/面', 21, 4, 500, 16, 14, 76, '均衡', 12),
('牛肉香卤拌粉/面', 21, 4, 520, 20, 14, 74, '增肌', 14),
('豆腐海带面/粉', 21, 1, 340, 10, 4, 66, '减脂', 6),
('西红柿鸡蛋面/粉', 21, 1, 360, 10, 6, 66, '均衡', 6),
('青椒炒肉面/粉', 21, 1, 440, 14, 10, 72, '均衡', 11),
('杭椒鸡杂面/粉', 21, 1, 450, 16, 10, 72, '增肌', 12),
('麻辣鸡丁面/粉', 21, 1, 460, 18, 10, 72, '增肌', 12),
('原汤肉沫粉/面', 21, 1, 380, 10, 6, 70, '均衡', 7),
('雪菜肉沫粉/面', 21, 1, 390, 10, 6, 72, '均衡', 8),
('三鲜粉/面', 21, 1, 380, 12, 5, 72, '均衡', 8),
('香菇鸡块粉/面', 21, 1, 420, 16, 8, 72, '增肌', 10),
('啤酒鸭粉/面', 21, 1, 450, 18, 10, 72, '增肌', 11),
('五香卤肉粉/面', 21, 1, 480, 16, 12, 74, '均衡', 12),
('香辣牛杂粉/面', 21, 1, 460, 18, 12, 70, '增肌', 13),
('香辣牛肉粉/面', 21, 1, 480, 20, 12, 72, '增肌', 14),
('绝味肥肠粉/面', 21, 1, 500, 16, 16, 72, '均衡', 15),
('热干面(230g)', 21, 4, 400, 8, 10, 70, '均衡', 3.5),
('热干面(150g)', 21, 4, 280, 6, 7, 48, '均衡', 2.5),
('油泼面', 21, 4, 420, 10, 8, 74, '均衡', 7);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('素拼土豆泥拌饭', 22, 3, 420, 10, 8, 76, '均衡', 9),
('肉末茄子土豆泥拌饭', 22, 3, 500, 14, 14, 78, '均衡', 11),
('肉末豆腐土豆泥拌饭', 22, 3, 490, 16, 12, 78, '均衡', 11),
('酥皮鸡土豆泥拌饭', 22, 3, 540, 22, 14, 80, '增肌', 12),
('照烧鸡土豆泥拌饭', 22, 3, 530, 22, 12, 80, '增肌', 12),
('咖喱鸡土豆泥饭', 22, 3, 540, 20, 14, 80, '增肌', 12),
('绝味鸡土豆泥拌饭', 22, 3, 550, 22, 14, 80, '增肌', 12),
('香菇肉丸土豆泥拌饭', 22, 3, 520, 18, 14, 78, '增肌', 12),
('蜜汁鸡腿土豆泥拌饭', 22, 3, 560, 24, 14, 82, '增肌', 13),
('甜皮鸭土豆泥拌饭', 22, 3, 580, 24, 16, 80, '增肌', 13),
('藤椒鸡丝土豆泥拌饭', 22, 3, 520, 22, 12, 80, '增肌', 13),
('锅包肉土豆泥拌饭', 22, 3, 600, 18, 22, 80, '增肌', 13),
('麻辣肉片土豆泥拌饭', 22, 3, 580, 22, 18, 80, '增肌', 13),
('黑椒肉柳土豆泥拌饭', 22, 3, 600, 24, 16, 82, '增肌', 14),
('把子肉土豆泥拌饭', 22, 3, 620, 22, 20, 82, '增肌', 14),
('香辣肉脯土豆泥拌饭', 22, 3, 600, 24, 18, 80, '增肌', 14),
('蒜香排骨土豆泥拌饭', 22, 3, 650, 26, 22, 82, '增肌', 15);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('一荤两素套餐', 23, 3, 550, 20, 16, 80, '均衡', 8),
('两荤一素套餐', 23, 3, 650, 28, 22, 82, '增肌', 10),
('米饭', 23, 3, 120, 3, 0, 26, '均衡', 0.3),
('一荤一素经济套餐', 23, 3, 400, 14, 10, 62, '均衡', 3),
('两荤经济套餐', 23, 3, 480, 20, 16, 60, '增肌', 3.5);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('鲍汁肉沫豆腐', 24, 3, 450, 14, 12, 72, '均衡', 10),
('鲍汁麻香鸡', 24, 3, 520, 24, 14, 74, '增肌', 12),
('鲍汁烧鸭', 24, 3, 540, 24, 16, 74, '增肌', 12),
('鲍汁小酥肉', 24, 3, 550, 20, 22, 70, '增肌', 12),
('鲍汁焖鸡', 24, 3, 530, 24, 14, 74, '增肌', 12),
('鲍汁腌肉片', 24, 3, 560, 22, 18, 74, '增肌', 13),
('鲍汁鸡公煲(干锅含面)', 24, 16, 580, 24, 16, 80, '增肌', 13),
('鲍汁牛蛙鸡煲(干锅含面)', 24, 16, 600, 28, 16, 80, '增肌', 14),
('鲍汁基围虾', 24, 3, 480, 26, 8, 76, '增肌', 14),
('鲍汁排骨', 24, 3, 580, 24, 20, 74, '增肌', 15),
('鲍汁涮肉片', 24, 3, 600, 26, 22, 74, '增肌', 15),
('鲍汁肥肠鸡煲(干锅含面)', 24, 16, 620, 24, 20, 82, '增肌', 15),
('粉蒸素菜', 24, 11, 120, 5, 2, 20, '减脂', 2),
('蒸鱼头', 24, 11, 180, 18, 8, 10, '增肌', 3),
('豆腐圆子', 24, 11, 160, 8, 8, 14, '均衡', 4),
('粉蒸鱼块', 24, 11, 220, 20, 10, 12, '增肌', 5),
('珍珠肉圆', 24, 11, 240, 14, 14, 14, '增肌', 6),
('粉蒸肉', 24, 11, 300, 12, 22, 12, '增肌', 7),
('粉蒸鸡爪', 24, 11, 250, 14, 16, 10, '增肌', 7),
('粉蒸排骨', 24, 11, 320, 18, 20, 14, '增肌', 8);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('鸡蛋软饼', 25, 7, 120, 5, 4, 18, '均衡', 2),
('千层饼', 25, 7, 200, 6, 8, 26, '均衡', 2.5),
('韭菜鸡蛋饼', 25, 7, 180, 7, 8, 22, '均衡', 3),
('芝麻酥饼', 25, 7, 220, 6, 10, 26, '均衡', 3),
('土豆丝卷饼', 25, 7, 180, 5, 6, 26, '均衡', 3),
('香辣牛肉饼', 25, 7, 260, 12, 10, 28, '增肌', 4),
('热狗肠', 25, 5, 80, 3, 6, 4, '均衡', 1),
('茶叶蛋', 25, 5, 70, 6, 5, 1, '均衡', 1),
('脆皮饺', 25, 5, 140, 5, 6, 16, '均衡', 2.5),
('香煎鸡腿', 25, 5, 200, 18, 10, 8, '增肌', 5),
('蒸红薯', 25, 5, 80, 2, 0, 18, '减脂', 6),
('大白菜猪肉蒸饺', 25, 8, 240, 10, 8, 32, '均衡', 4),
('玉米鲜肉蒸饺', 25, 8, 250, 10, 9, 32, '均衡', 4),
('西红柿馅蒸饺', 25, 8, 220, 8, 6, 34, '均衡', 4),
('包菜猪肉蒸饺', 25, 8, 240, 10, 8, 32, '均衡', 4),
('韭菜粉丝煎饺', 25, 8, 230, 8, 8, 32, '均衡', 4),
('韭菜鸡蛋锅贴', 25, 8, 220, 8, 8, 30, '均衡', 4),
('大白菜肉馅锅贴', 25, 8, 240, 10, 9, 30, '均衡', 4),
('牛肉锅贴', 25, 8, 260, 14, 10, 28, '增肌', 6),
('银耳羹', 25, 2, 80, 1, 0, 18, '减脂', 2),
('八宝粥', 25, 2, 140, 5, 2, 26, '均衡', 2),
('红薯粥', 25, 2, 120, 2, 1, 26, '减脂', 2),
('紫薯粥', 25, 2, 110, 2, 1, 24, '减脂', 2),
('粘豆包', 25, 7, 160, 6, 2, 30, '均衡', 2.5),
('小葱猪肉小笼包', 25, 7, 250, 14, 10, 28, '增肌', 4),
('生煎包', 25, 7, 260, 14, 12, 26, '增肌', 4),
('芹菜豆腐汽水包', 25, 7, 140, 6, 4, 20, '减脂', 2),
('香辣粉条汽水包', 25, 7, 150, 4, 5, 22, '均衡', 2),
('五香莲藕汽水包', 25, 7, 140, 4, 4, 22, '均衡', 2),
('鸡肉手抓饭+鸡蛋+时蔬', 25, 3, 520, 22, 14, 76, '增肌', 10),
('卤肉手抓饭+鸡蛋+时蔬', 25, 3, 580, 20, 18, 78, '增肌', 13),
('牛肉手抓饭+鸡蛋+时蔬', 25, 3, 600, 26, 18, 78, '增肌', 15);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('香干回锅肉饭+时蔬', 26, 3, 520, 18, 16, 74, '均衡', 11),
('超大鸡排饭+时蔬', 26, 3, 550, 24, 14, 78, '增肌', 11),
('藤椒鸡肉饭+时蔬', 26, 3, 500, 22, 12, 76, '增肌', 11),
('菠萝咕噜肉饭+时蔬', 26, 3, 530, 18, 14, 80, '均衡', 11),
('卤香肉肠饭+时蔬', 26, 3, 540, 18, 16, 78, '均衡', 11),
('卤香脆骨饭+时蔬', 26, 3, 520, 20, 14, 76, '增肌', 12),
('台式卤肉饭+时蔬', 26, 3, 560, 18, 18, 78, '均衡', 12),
('手撕鸡饭+时蔬', 26, 3, 500, 24, 10, 76, '增肌', 12),
('麻辣鸭块饭+时蔬', 26, 3, 520, 22, 14, 74, '增肌', 12),
('黑鸭边腿饭+时蔬', 26, 3, 540, 24, 16, 72, '增肌', 12),
('卤香顺风饭+时蔬', 26, 3, 560, 20, 18, 76, '增肌', 13),
('卤香肥肠饭+时蔬', 26, 3, 550, 18, 20, 74, '均衡', 13),
('鸡全腿饭+时蔬', 26, 3, 580, 26, 18, 76, '增肌', 13),
('隆江猪脚饭+鸡蛋+时蔬', 26, 3, 620, 24, 22, 78, '增肌', 14),
('爆汁叉烧饭+时蔬', 26, 3, 600, 24, 20, 78, '增肌', 14),
('卤汁五花肉饭+时蔬', 26, 3, 610, 20, 24, 76, '增肌', 14),
('卤香牛肚饭+时蔬', 26, 3, 560, 22, 18, 74, '增肌', 14);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('土豆丝', 27, 11, 80, 2, 3, 12, '减脂', 2),
('清炒时蔬', 27, 11, 40, 2, 1, 6, '减脂', 2),
('莴苣炒肉片', 27, 11, 160, 10, 10, 8, '均衡', 4),
('豆角肉丝', 27, 11, 150, 10, 8, 10, '均衡', 4),
('黑木耳炒肉', 27, 11, 170, 12, 10, 8, '均衡', 4),
('千张鸭血', 27, 11, 160, 12, 8, 10, '均衡', 4),
('面筋烧五花肉', 27, 11, 220, 12, 16, 8, '增肌', 4),
('土豆烧鸡', 27, 11, 200, 16, 10, 12, '增肌', 4),
('脆皮鸭', 27, 11, 240, 18, 14, 10, '增肌', 6),
('锅包肉', 27, 11, 260, 14, 16, 14, '增肌', 6),
('小酥肉', 27, 11, 250, 14, 16, 12, '增肌', 6),
('爆猪肝', 27, 11, 200, 18, 10, 8, '增肌', 6),
('辣子鸡', 27, 11, 230, 20, 12, 10, '增肌', 6),
('清炒藕带', 27, 11, 60, 2, 1, 12, '减脂', 6),
('卤水鸡', 27, 11, 220, 20, 12, 6, '增肌', 6),
('回锅牛肉', 27, 11, 280, 22, 18, 6, '增肌', 8),
('红烧排骨', 27, 11, 260, 16, 18, 8, '增肌', 8),
('鹌鹑蛋烧红烧肉', 27, 11, 300, 18, 22, 8, '增肌', 8),
('孜然锁骨', 27, 11, 240, 18, 16, 6, '增肌', 8),
('椒盐基围虾', 27, 11, 200, 22, 6, 14, '增肌', 8),
('蒜苗炒顺风', 27, 11, 260, 16, 18, 8, '增肌', 8),
('米饭', 27, 3, 120, 3, 0, 26, '均衡', 0.3),
('一荤一素经济套餐', 27, 3, 400, 14, 10, 62, '均衡', 3),
('两荤经济套餐', 27, 3, 480, 20, 16, 60, '增肌', 3.5);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('鱼香茄子', 28, 3, 420, 8, 12, 68, '均衡', 10),
('红烧鲫鱼', 28, 3, 380, 22, 10, 50, '增肌', 10),
('竹笋炒肉丝', 28, 3, 450, 16, 12, 70, '均衡', 11),
('外婆菜炒青豆', 28, 3, 400, 12, 10, 66, '均衡', 11),
('酸辣鸡胗', 28, 3, 430, 20, 12, 60, '增肌', 12),
('东安辣子鸡', 28, 3, 480, 22, 14, 66, '增肌', 12),
('江门腊肠', 28, 3, 500, 16, 18, 68, '均衡', 12),
('黑椒鸡扒', 28, 3, 520, 26, 14, 72, '增肌', 12),
('烤肉', 28, 3, 550, 24, 20, 66, '增肌', 12),
('卜豆角炒肉片', 28, 3, 460, 16, 14, 68, '均衡', 12),
('牛肉茄子', 28, 3, 480, 20, 16, 64, '增肌', 13),
('梅菜扣肉', 28, 3, 560, 16, 24, 68, '均衡', 13),
('湖南小炒肉', 28, 3, 520, 18, 18, 70, '增肌', 13),
('回锅肉', 28, 3, 540, 16, 22, 68, '增肌', 13),
('湖南特色菜', 28, 3, 500, 16, 16, 72, '均衡', 13),
('土豆蒸排骨', 28, 3, 520, 20, 18, 68, '增肌', 13),
('湘味酱香肉', 28, 3, 540, 18, 20, 68, '增肌', 13),
('湖南辣脆骨', 28, 3, 500, 18, 18, 66, '增肌', 13),
('可乐鸡', 28, 3, 530, 24, 14, 74, '增肌', 13),
('红烧肉', 28, 3, 580, 16, 28, 64, '增肌', 14),
('红烧蹄筋', 28, 3, 520, 22, 16, 68, '增肌', 15),
('下饭牛肉', 28, 3, 560, 26, 18, 70, '增肌', 15),
('牛肉鸡扒', 28, 3, 600, 30, 18, 72, '增肌', 15);

INSERT INTO dish (dish_name, canteen_id, cate_id, calories, protein, fat, carbs, fit_target, price) VALUES
('永和豆浆', 29, 6, 80, 6, 2, 10, '减脂', 2),
('原味豆浆', 29, 6, 70, 5, 2, 8, '减脂', 2),
('红枣豆浆（大杯）', 29, 6, 100, 6, 2, 14, '减脂', 3),
('黑芝麻豆浆（大杯）', 29, 6, 110, 6, 3, 14, '减脂', 3),
('无糖豆浆（大杯）', 29, 6, 60, 6, 1, 6, '减脂', 3),
('酸梅汁', 29, 6, 80, 0, 0, 20, '均衡', 2),
('特色冰粉', 29, 6, 100, 1, 2, 20, '均衡', 3),
('双皮奶', 29, 6, 120, 4, 4, 16, '均衡', 3),
('绿豆沙', 29, 6, 110, 4, 1, 22, '减脂', 3),
('玉米汁', 29, 6, 100, 2, 1, 22, '减脂', 4),
('椰子西米露', 29, 6, 160, 2, 5, 28, '均衡', 5),
('凉粉水果捞', 29, 6, 180, 3, 4, 34, '均衡', 6);

SELECT COUNT(*) FROM dish WHERE canteen_id BETWEEN 17 AND 29;

USE shishan_shike;
ALTER TABLE dish MODIFY COLUMN price DECIMAL(10,2) COMMENT '菜品价格（元）';

INSERT INTO canteen (canteen_name, location, business_hours, contact_phone) VALUES
('荟园一楼·奶茶饮品档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·山西特色面档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·传奇饼摊','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·肠粉水煮鱼档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·今鲜生炒饭锡纸饭档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·老武汉面食档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·荟园大包档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园一楼·精品快餐档','华中农业大学荟园一楼','07:00-22:00','027-87280001'),
('荟园三楼·特色烧烤档','华中农业大学荟园三楼','10:00-22:00','027-87280003'),
('荟园三楼·王喜峰麻辣烫档','华中农业大学荟园三楼','10:00-22:00','027-87280003'),
('荟园三楼·十分粥道档','华中农业大学荟园三楼','07:00-22:00','027-87280003'),
('荟园三楼·蒸功夫档','华中农业大学荟园三楼','10:00-22:00','027-87280003'),
('荟园三楼·胖达人精品菜档','华中农业大学荟园三楼','10:00-22:00','027-87280003'),
('荟园三楼·牛骨面肉夹馍档','华中农业大学荟园三楼','07:00-22:00','027-87280003'),
('荟园三楼·铁板烧档','华中农业大学荟园三楼','10:00-22:00','027-87280003'),
('荟园三楼·饮品甜品档','华中农业大学荟园三楼','09:00-22:00','027-87280003'),
('荟园二楼·马祯香兰州牛肉面档','华中农业大学荟园二楼','07:00-22:00','027-87280002'),
('荟园二楼·湘味小炒档','华中农业大学荟园二楼','10:00-22:00','027-87280002'),
('荟园二楼·赣味小炒档','华中农业大学荟园二楼','10:00-22:00','027-87280002');
SELECT canteen_id, canteen_name FROM canteen WHERE location LIKE '%荟园%' ORDER BY canteen_id;

INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('冰鲜柠檬水', 30, 3.00, 30, 0.1, 0, 7, 6, '解渴', 1),
('茉莉绿茶', 30, 4.00, 20, 0.1, 0, 5, 4, '解渴', 1),
('橙汁', 30, 6.00, 80, 0.5, 0, 20, 18, '补充维C', 1),
('西瓜汁', 30, 6.00, 70, 0.6, 0, 17, 15, '解渴', 1),
('西柚汁', 30, 6.00, 65, 0.7, 0, 16, 14, '减脂', 1),
('多肉芒果', 30, 6.00, 120, 1.0, 0.5, 30, 25, '解馋', 1),
('百香柠檬', 30, 6.00, 75, 0.5, 0, 18, 16, '开胃', 1),
('杨梅止渴', 30, 6.00, 90, 0.8, 0, 22, 20, '解渴', 1),
('桃桃莓莓', 30, 6.00, 110, 0.9, 0.3, 27, 24, '解馋', 1),
('青桔菠萝茶', 30, 6.00, 85, 0.6, 0, 21, 19, '开胃', 1),
('手捣猕猴桃', 30, 6.00, 70, 0.7, 0, 17, 15, '补充维C', 1),
('多肉葡萄冻冻', 30, 6.00, 100, 0.8, 0.4, 25, 22, '解馋', 1),
('青桔柠檬红茶', 30, 6.00, 95, 0.5, 0, 23, 20, '解渴', 1),
('炫彩冰粉', 30, 5.00, 150, 2.0, 1.0, 35, 28, '解馋', 1),
('红豆双皮奶', 30, 4.00, 180, 4.0, 5.0, 25, 18, '解馋', 1),
('椰果双皮奶', 30, 4.00, 170, 3.5, 4.5, 24, 17, '解馋', 1),
('奥利奥双皮奶', 30, 5.00, 220, 4.0, 7.0, 30, 22, '解馋', 1),
('芒果玻子汽水', 30, 6.00, 90, 0.2, 0, 22, 20, '解渴', 1),
('草莓玻子汽水', 30, 6.00, 95, 0.2, 0, 23, 21, '解渴', 1),
('蓝莓玻子汽水', 30, 6.00, 85, 0.3, 0, 21, 19, '解渴', 1),
('柠七/柠乐', 30, 6.00, 100, 0.1, 0, 25, 23, '解渴', 1),
('原味酸奶', 30, 4.00, 120, 4.0, 3.5, 15, 10, '补充蛋白', 1),
('芒果酸奶', 30, 4.00, 140, 4.0, 3.5, 18, 13, '补充蛋白', 1),
('草莓酸奶', 30, 4.00, 145, 4.0, 3.5, 19, 14, '补充蛋白', 1),
('蓝莓酸奶', 30, 4.00, 150, 4.0, 3.5, 20, 15, '补充蛋白', 1),
('果粒酸奶', 30, 5.00, 160, 4.5, 4.0, 22, 17, '补充蛋白', 1),
('火龙果酸奶', 30, 8.00, 130, 4.5, 4.0, 16, 11, '润肠', 1),
('红茶奶盖', 30, 6.00, 180, 3.0, 10.0, 15, 8, '解馋', 1),
('四季春奶盖', 30, 6.00, 175, 2.8, 9.5, 14, 7, '解馋', 1),
('蜜桃乌龙奶盖', 30, 6.00, 185, 3.0, 10.0, 16, 9, '解馋', 1),
('芝士芒芒', 30, 9.00, 220, 4.0, 12.0, 25, 18, '解馋', 1),
('芝士桃桃', 30, 9.00, 215, 3.8, 11.5, 24, 17, '解馋', 1),
('芝士多肉葡萄', 30, 9.00, 230, 4.2, 12.5, 26, 19, '解馋', 1),
('芝士抹茶奶盖', 30, 9.00, 200, 4.0, 11.0, 20, 12, '解馋', 1),
('原味奶茶', 30, 5.00, 200, 3.0, 8.0, 28, 20, '解馋', 1),
('珍珠奶茶', 30, 5.00, 220, 3.0, 8.0, 32, 22, '解馋', 1),
('椰果奶茶', 30, 5.00, 210, 3.0, 8.0, 30, 21, '解馋', 1),
('红豆相思奶茶', 30, 5.00, 230, 4.0, 8.5, 33, 23, '解馋', 1),
('奥利奥奶茶', 30, 5.00, 250, 4.0, 10.0, 35, 25, '解馋', 1),
('椰奶西米露', 30, 5.00, 200, 2.5, 9.0, 28, 18, '解馋', 1),
('芒果布丁椰椰', 30, 5.00, 210, 3.0, 8.5, 30, 22, '解馋', 1),
('抹茶红豆', 30, 5.00, 220, 3.5, 8.0, 31, 23, '解馋', 1),
('全料烧仙草', 30, 8.00, 280, 5.0, 10.0, 40, 28, '解馋', 1),
('雀巢咖啡', 30, 5.00, 120, 2.0, 3.0, 18, 15, '提神', 1),
('蜂蜜柚子茶', 30, 5.00, 130, 0.5, 0, 32, 28, '润喉', 1),
('杨枝甘露(小杯)', 30, 7.00, 180, 3.0, 6.0, 25, 20, '解馋', 1),
('杨枝甘露(大杯)', 30, 10.00, 260, 4.5, 9.0, 37, 30, '解馋', 1),
('经典美式', 30, 5.00, 5, 0.3, 0, 1, 0, '提神', 1),
('葡萄美式', 30, 7.00, 80, 0.3, 0, 20, 18, '提神', 1),
('生椰拿铁', 30, 8.00, 150, 3.0, 8.0, 15, 10, '提神', 1),
('拿铁咖啡', 30, 8.00, 130, 4.0, 7.0, 10, 6, '提神', 1),
('香草拿铁', 30, 9.00, 180, 4.0, 9.0, 18, 12, '提神', 1),
('黑糖冰粉', 30, 5.00, 160, 2.0, 1.0, 38, 30, '解馋', 1),
('酸梅冰粉', 30, 5.00, 120, 1.5, 0.5, 30, 25, '开胃', 1),
('小芋圆冰粉', 30, 5.00, 180, 2.5, 1.0, 42, 32, '解馋', 1),
('百香柠檬冰粉', 30, 5.00, 130, 1.8, 0.5, 32, 27, '开胃', 1),
('红糖米酒冰粉', 30, 6.00, 200, 3.0, 1.5, 45, 35, '解馋', 1),
('水果大满贯冰粉', 30, 6.00, 180, 2.5, 1.0, 40, 33, '解馋', 1),
('豆花布丁', 30, 8.00, 220, 5.0, 6.0, 30, 22, '解馋', 1),
('冰淇淋', 30, 3.00, 150, 3.0, 8.0, 18, 12, '解馋', 1),
('草莓圣代', 30, 6.00, 200, 3.5, 10.0, 25, 18, '解馋', 1),
('奥利奥圣代', 30, 6.00, 220, 3.5, 11.0, 27, 20, '解馋', 1),
('永和豆浆', 30, 2.00, 80, 3.0, 1.5, 10, 2, '早餐', 1),
('芋味米浆', 30, 3.00, 100, 2.5, 2.0, 15, 5, '早餐', 1),
('绿豆沙', 30, 3.00, 90, 3.0, 0.5, 18, 8, '清热', 1),
('燕麦牛奶', 30, 3.00, 120, 4.0, 3.0, 15, 6, '早餐', 1),
('金牌椰奶', 30, 4.00, 130, 3.0, 5.0, 16, 8, '早餐', 1),
('鲜榨玉米牛奶', 30, 5.00, 130, 4.0, 3.0, 18, 8, '早餐', 1),
('鲜榨红枣牛奶', 30, 5.00, 140, 4.5, 3.5, 19, 10, '补血', 1),
('鲜榨香芋牛奶', 30, 5.00, 150, 4.0, 4.0, 20, 9, '早餐', 1),
('鲜榨紫薯牛奶', 30, 5.00, 145, 4.2, 3.8, 19, 8, '早餐', 1),
('鲜榨南瓜牛奶', 30, 5.00, 135, 4.0, 3.2, 18, 7, '早餐', 1),
('冰糖雪梨', 30, 5.00, 110, 0.5, 0, 27, 23, '润喉', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('青菜汤面', 31, 4.00, 350, 10.0, 5.0, 65, 3, '早餐', 1),
('阳春面', 31, 5.00, 400, 12.0, 6.0, 70, 3, '早餐', 1),
('榨菜肉丝面', 31, 6.00, 450, 15.0, 8.0, 68, 3, '早餐', 1),
('香菇肉丝面', 31, 6.00, 460, 16.0, 8.5, 67, 3, '早餐', 1),
('炸酱面', 31, 6.00, 480, 15.0, 12.0, 65, 5, '午餐', 1),
('牛肉汤面', 31, 8.00, 500, 22.0, 10.0, 60, 3, '午餐', 1),
('油泼辣子面', 31, 7.00, 480, 12.0, 15.0, 68, 3, '午餐', 1),
('陕记炸酱面', 31, 8.00, 520, 16.0, 14.0, 66, 5, '午餐', 1),
('火腿油泼面', 31, 8.00, 500, 18.0, 13.0, 67, 3, '午餐', 1),
('鸡蛋油泼面', 31, 9.00, 520, 18.0, 14.0, 68, 3, '午餐', 1),
('炸酱油泼面', 31, 9.00, 550, 17.0, 16.0, 66, 5, '午餐', 1),
('肉丝油泼面', 31, 10.00, 580, 20.0, 18.0, 65, 3, '午餐', 1),
('牛肉油泼面', 31, 12.00, 620, 25.0, 20.0, 63, 3, '午餐', 1),
('西红柿鸡蛋汤面', 31, 8.00, 450, 15.0, 8.0, 65, 6, '午餐', 1),
('岐山臊子面', 31, 9.00, 500, 16.0, 12.0, 67, 4, '午餐', 1),
('青椒肉丝汤面', 31, 10.00, 520, 20.0, 13.0, 65, 3, '午餐', 1),
('牛肉手工汤面', 31, 11.00, 550, 24.0, 14.0, 64, 3, '午餐', 1),
('西红柿鸡蛋打卤面', 31, 9.00, 480, 16.0, 10.0, 66, 6, '午餐', 1),
('茄子肉丁打卤面', 31, 10.00, 500, 15.0, 12.0, 68, 5, '午餐', 1),
('豆角肉沫打卤面', 31, 10.00, 510, 17.0, 11.0, 67, 4, '午餐', 1),
('土豆肉丝打卤面', 31, 10.00, 500, 18.0, 12.0, 66, 5, '午餐', 1),
('剁椒肉沫打卤面', 31, 11.00, 520, 17.0, 13.0, 67, 4, '午餐', 1),
('运城大盘鸡面', 31, 11.00, 580, 26.0, 18.0, 65, 4, '午餐', 1),
('辣子鸡丁打卤面', 31, 12.00, 550, 22.0, 16.0, 66, 4, '午餐', 1),
('土豆牛肉打卤面', 31, 13.00, 600, 25.0, 18.0, 64, 5, '午餐', 1),
('西红柿鸡蛋炒面', 31, 9.00, 500, 16.0, 12.0, 68, 6, '午餐', 1),
('全料肉丝炒面', 31, 10.00, 550, 20.0, 15.0, 66, 4, '午餐', 1),
('牛肉炒面', 31, 12.00, 600, 25.0, 18.0, 64, 4, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('火腿卷饼', 32, 3.00, 250, 8.0, 10.0, 30, 2, '早餐', 1),
('鸡蛋肉饼', 32, 3.00, 280, 10.0, 12.0, 28, 2, '早餐', 1),
('鸡柳卷饼', 32, 3.50, 300, 12.0, 13.0, 29, 2, '早餐', 1),
('鲜香肉饼', 32, 3.50, 320, 10.0, 15.0, 27, 2, '早餐', 1),
('火腿鸡蛋饼', 32, 4.00, 300, 12.0, 13.0, 28, 2, '早餐', 1),
('火腿土豆丝饼', 32, 4.00, 280, 10.0, 11.0, 32, 3, '早餐', 1),
('手抓饼(鸡蛋香肠)', 32, 6.00, 380, 15.0, 18.0, 30, 2, '早餐', 1),
('手抓饼(鸡蛋鸡柳)', 32, 6.50, 400, 17.0, 20.0, 29, 2, '早餐', 1),
('韭菜鸡蛋饼', 32, 8.00, 350, 12.0, 15.0, 30, 2, '早餐', 1),
('千层饼', 32, 8.00, 400, 8.0, 20.0, 35, 2, '早餐', 1),
('土家酱香饼', 32, 8.00, 380, 9.0, 18.0, 33, 3, '早餐', 1),
('牛肉夹馍', 32, 9.00, 420, 20.0, 18.0, 30, 2, '午餐', 1),
('鸡蛋煎饼', 32, 2.00, 200, 8.0, 8.0, 25, 2, '早餐', 1),
('青椒肉丝夹馍', 32, 3.00, 300, 12.0, 10.0, 28, 2, '午餐', 1),
('卤肉夹馍', 32, 5.00, 400, 18.0, 18.0, 27, 2, '午餐', 1),
('鸡排鸡蛋夹馍', 32, 6.00, 450, 22.0, 20.0, 28, 2, '午餐', 1),
('豆腐脑', 32, 2.00, 80, 4.0, 2.0, 10, 1, '早餐', 1),
('胡辣汤', 32, 3.00, 150, 8.0, 5.0, 18, 2, '早餐', 1),
('三鲜豆皮', 32, 3.00, 200, 6.0, 8.0, 25, 2, '早餐', 1),
('粽子(红枣/豆沙)', 32, 3.00, 180, 4.0, 2.0, 35, 15, '早餐', 1),
('粽子(鲜肉)', 32, 3.50, 220, 8.0, 6.0, 30, 3, '早餐', 1),
('煎饺', 32, 5.00, 200, 6.0, 8.0, 25, 2, '早餐', 1),
('手工锅贴饺', 32, 1.00, 40, 1.5, 1.5, 5, 0.5, '早餐', 1),
('蛋炒饭', 32, 5.00, 350, 10.0, 8.0, 55, 3, '午餐', 1),
('扬州炒饭', 32, 5.00, 380, 12.0, 10.0, 58, 4, '午餐', 1),
('豆角肉丝焖面', 32, 8.00, 450, 15.0, 12.0, 60, 3, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('鸡蛋肠粉', 33, 5.00, 250, 10.0, 5.0, 35, 2, '早餐', 1),
('火腿肠粉', 33, 5.00, 280, 12.0, 6.0, 36, 2, '早餐', 1),
('瘦肉肠粉', 33, 6.00, 300, 15.0, 7.0, 35, 2, '早餐', 1),
('鸡蛋火腿肠粉', 33, 6.00, 300, 13.0, 6.5, 36, 2, '早餐', 1),
('鸡蛋瘦肉肠粉', 33, 7.00, 320, 16.0, 7.5, 35, 2, '早餐', 1),
('水煮时蔬', 33, 9.00, 150, 5.0, 5.0, 15, 5, '减脂', 1),
('水煮千张', 33, 10.00, 200, 12.0, 8.0, 10, 2, '午餐', 1),
('水煮毛血旺', 33, 11.00, 350, 20.0, 18.0, 15, 3, '午餐', 1),
('水煮肉片', 33, 12.00, 450, 25.0, 22.0, 10, 2, '午餐', 1),
('水煮鸡肉片', 33, 12.00, 400, 30.0, 18.0, 8, 2, '午餐', 1),
('水煮黑椒牛柳', 33, 12.00, 420, 28.0, 20.0, 8, 2, '午餐', 1),
('水煮腊肠', 33, 12.00, 480, 20.0, 28.0, 12, 3, '午餐', 1),
('水煮卤味鸡尖', 33, 12.00, 380, 22.0, 20.0, 10, 2, '午餐', 1),
('水煮卤味鸡腿', 33, 13.00, 450, 30.0, 22.0, 10, 2, '午餐', 1),
('腿翅双拼', 33, 13.00, 500, 32.0, 25.0, 10, 2, '午餐', 1),
('开胃番茄鱼', 33, 13.00, 420, 28.0, 15.0, 12, 5, '午餐', 1),
('招牌水煮鱼', 33, 13.00, 450, 30.0, 18.0, 10, 3, '午餐', 1),
('秘制酸菜鱼', 33, 13.00, 430, 29.0, 17.0, 11, 4, '午餐', 1),
('水煮肥牛卷', 33, 15.00, 500, 32.0, 25.0, 8, 2, '午餐', 1),
('水煮牛肉', 33, 15.00, 480, 35.0, 22.0, 8, 2, '午餐', 1),
('水煮牛肚', 33, 15.00, 450, 30.0, 20.0, 8, 2, '午餐', 1),
('水煮黄牛肉', 33, 15.00, 490, 36.0, 23.0, 8, 2, '午餐', 1),
('水煮肉片(大份)', 33, 22.00, 700, 40.0, 35.0, 15, 3, '午餐', 1),
('招牌水煮鱼(大份)', 33, 24.00, 750, 45.0, 38.0, 12, 3, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('传统炒饭', 34, 5.00, 350, 10.0, 8.0, 55, 3, '午餐', 1),
('老干妈火腿炒饭/粉/面', 34, 8.00, 400, 12.0, 12.0, 58, 4, '午餐', 1),
('扬州炒饭', 34, 9.00, 380, 12.0, 10.0, 60, 4, '午餐', 1),
('奥尔良炒饭', 34, 10.00, 420, 18.0, 12.0, 56, 3, '午餐', 1),
('酸豆角炒饭', 34, 10.00, 400, 12.0, 10.0, 58, 4, '午餐', 1),
('培根炒饭/粉/面', 34, 10.00, 420, 15.0, 15.0, 55, 3, '午餐', 1),
('肉丝鸡蛋炒饭/粉', 34, 10.00, 410, 16.0, 13.0, 57, 3, '午餐', 1),
('广式腊肠炒饭/粉', 34, 10.00, 430, 14.0, 16.0, 56, 4, '午餐', 1),
('咖喱菠萝鸡丁炒饭', 34, 12.00, 480, 18.0, 14.0, 62, 8, '午餐', 1),
('海鲜炒饭/粉/面', 34, 12.00, 450, 20.0, 12.0, 58, 4, '午餐', 1),
('黑椒牛柳炒饭/粉', 34, 12.00, 480, 22.0, 16.0, 56, 3, '午餐', 1),
('锡纸鸭血饭', 34, 9.00, 400, 18.0, 10.0, 50, 2, '午餐', 1),
('锡纸豆腐饭', 34, 9.00, 350, 15.0, 8.0, 52, 2, '午餐', 1),
('锡纸蟹味排饭', 34, 10.00, 420, 20.0, 12.0, 51, 2, '午餐', 1),
('锡纸猪肘饭', 34, 12.00, 500, 25.0, 20.0, 50, 2, '午餐', 1),
('锡纸鸡排饭', 34, 12.00, 480, 28.0, 16.0, 51, 2, '午餐', 1),
('锡纸鸡腿饭', 34, 12.00, 500, 30.0, 18.0, 50, 2, '午餐', 1),
('锡纸猪肝饭', 34, 12.00, 450, 25.0, 14.0, 50, 2, '午餐', 1),
('锡纸牛柳饭', 34, 12.00, 480, 28.0, 16.0, 50, 2, '午餐', 1),
('锡纸培根饭', 34, 12.00, 460, 20.0, 18.0, 50, 2, '午餐', 1),
('锡纸排骨饭', 34, 14.00, 520, 26.0, 22.0, 50, 2, '午餐', 1),
('锡纸牛蹄饭', 34, 15.00, 550, 28.0, 24.0, 50, 2, '午餐', 1),
('鲜肉馄饨', 34, 4.00, 200, 10.0, 6.0, 25, 1, '早餐', 1),
('鲜肉水饺', 34, 5.00, 220, 12.0, 7.0, 26, 1, '早餐', 1),
('黑芝麻汤圆', 34, 5.00, 250, 5.0, 8.0, 40, 15, '早餐', 1),
('瘦身南瓜粥(小碗)', 34, 1.50, 50, 1.0, 0.5, 10, 3, '早餐', 1),
('瘦身南瓜粥(大碗)', 34, 3.00, 100, 2.0, 1.0, 20, 6, '早餐', 1),
('绿豆粥(小碗)', 34, 1.50, 60, 2.0, 0.3, 12, 4, '早餐', 1),
('绿豆粥(大碗)', 34, 3.00, 120, 4.0, 0.6, 24, 8, '早餐', 1),
('养心黑米粥(小碗)', 34, 1.50, 70, 2.0, 0.5, 15, 5, '早餐', 1),
('养心黑米粥(大碗)', 34, 3.00, 140, 4.0, 1.0, 30, 10, '早餐', 1),
('营养八宝粥(小碗)', 34, 2.00, 80, 2.5, 1.0, 18, 6, '早餐', 1),
('营养八宝粥(大碗)', 34, 4.00, 160, 5.0, 2.0, 36, 12, '早餐', 1),
('皮蛋瘦肉粥(小碗)', 34, 2.00, 90, 4.0, 2.0, 12, 1, '早餐', 1),
('皮蛋瘦肉粥(大碗)', 34, 4.00, 180, 8.0, 4.0, 24, 2, '早餐', 1),
('冰糖银耳(小碗)', 34, 2.00, 70, 0.5, 0, 18, 12, '早餐', 1),
('冰糖银耳(大碗)', 34, 4.00, 140, 1.0, 0, 36, 24, '早餐', 1),
('汉森鸡肉卷', 34, 4.00, 220, 12.0, 8.0, 20, 1, '早餐', 1),
('卤鸡蛋', 34, 1.00, 70, 6.0, 5.0, 1, 0.5, '早餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('热干面(150g)', 35, 2.50, 300, 10.0, 12.0, 35, 2, '早餐', 1),
('全料热干面(220g)', 35, 3.50, 420, 14.0, 18.0, 45, 3, '早餐', 1),
('营养米线', 35, 4.00, 350, 12.0, 8.0, 45, 2, '早餐', 1),
('酸辣细粉', 35, 4.00, 380, 10.0, 10.0, 48, 4, '早餐', 1),
('酸辣苕粉', 35, 5.00, 400, 10.0, 12.0, 50, 4, '早餐', 1),
('水煮豆丝', 35, 5.00, 320, 8.0, 8.0, 45, 2, '早餐', 1),
('重庆担担面', 35, 5.00, 400, 12.0, 15.0, 48, 3, '午餐', 1),
('鸡块面', 35, 5.00, 420, 18.0, 12.0, 46, 3, '午餐', 1),
('香辣拌豆丝', 35, 5.00, 350, 9.0, 10.0, 47, 3, '午餐', 1),
('香辣拌面/粉', 35, 5.00, 380, 12.0, 12.0, 48, 3, '午餐', 1),
('炸酱面', 35, 5.00, 400, 14.0, 14.0, 46, 5, '午餐', 1),
('三鲜手擀面', 35, 5.00, 380, 13.0, 10.0, 47, 3, '午餐', 1),
('榨菜肉丝手擀面', 35, 5.00, 390, 15.0, 11.0, 46, 3, '午餐', 1),
('番茄鸡蛋手擀面', 35, 5.00, 380, 13.0, 10.0, 48, 6, '午餐', 1),
('牛肉面/粉', 35, 9.00, 480, 25.0, 15.0, 45, 2, '午餐', 1),
('台肠', 35, 1.00, 80, 3.0, 6.0, 2, 0.5, '早餐', 1),
('卤鸡蛋', 35, 1.00, 70, 6.0, 5.0, 1, 0.5, '早餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('小葱花卷', 36, 0.60, 100, 3.0, 1.0, 18, 1, '早餐', 1),
('白馒头', 36, 0.60, 120, 3.5, 0.5, 25, 0, '早餐', 1),
('莲藕鲜肉包', 36, 1.00, 150, 6.0, 4.0, 18, 1, '早餐', 1),
('玉米鲜肉包', 36, 1.00, 160, 6.0, 4.0, 20, 2, '早餐', 1),
('荟园鲜肉包', 36, 1.00, 150, 7.0, 4.5, 17, 1, '早餐', 1),
('香菇鲜肉包', 36, 1.00, 155, 7.0, 4.5, 17, 1, '早餐', 1),
('田藕鲜肉包', 36, 1.00, 150, 6.5, 4.0, 18, 1, '早餐', 1),
('粉丝肉末包', 36, 1.00, 140, 5.0, 3.5, 20, 1, '早餐', 1),
('胡萝卜肉包', 36, 1.00, 150, 6.5, 4.0, 18, 1, '早餐', 1),
('酸菜包', 36, 1.00, 130, 4.0, 3.0, 20, 1, '早餐', 1),
('豆沙包', 36, 1.00, 160, 4.0, 1.5, 30, 12, '早餐', 1),
('白糖包', 36, 1.00, 170, 3.5, 1.0, 32, 14, '早餐', 1),
('花馒头', 36, 1.00, 130, 3.5, 0.5, 27, 0, '早餐', 1),
('桂花糕', 36, 1.00, 150, 3.0, 1.0, 30, 10, '早餐', 1),
('玉米面馒头', 36, 1.00, 130, 4.0, 0.8, 27, 1, '早餐', 1),
('红豆卷', 36, 1.00, 160, 4.0, 1.0, 30, 10, '早餐', 1),
('肉松花卷', 36, 1.00, 150, 5.0, 3.0, 25, 1, '早餐', 1),
('烧麦', 36, 1.00, 140, 4.0, 2.0, 25, 1, '早餐', 1),
('红糖方糕', 36, 2.00, 180, 3.0, 1.0, 38, 15, '早餐', 1),
('玉米棒', 36, 3.00, 120, 4.0, 1.0, 25, 5, '早餐', 1),
('奶黄包(4个)', 36, 3.50, 200, 5.0, 4.0, 30, 15, '早餐', 1),
('蒸饺(8个)', 36, 4.00, 180, 6.0, 5.0, 25, 1, '早餐', 1),
('蒸红薯', 36, 6.00, 100, 1.5, 0.2, 25, 8, '早餐', 1),
('白水鸡蛋', 36, 0.70, 70, 6.0, 5.0, 1, 0.5, '早餐', 1),
('卤鸡蛋', 36, 1.00, 75, 6.0, 5.5, 1, 0.5, '早餐', 1),
('酸梅汤', 36, 1.00, 60, 0.2, 0, 15, 12, '早餐', 1),
('鲜豆浆', 36, 1.00, 80, 3.0, 1.5, 10, 2, '早餐', 1),
('油饼', 36, 1.00, 180, 4.0, 10.0, 20, 1, '早餐', 1),
('南瓜饼', 36, 1.00, 150, 3.0, 6.0, 22, 8, '早餐', 1),
('鸡冠饺', 36, 1.50, 200, 5.0, 12.0, 20, 1, '早餐', 1),
('欢喜坨', 36, 1.50, 180, 3.0, 8.0, 25, 10, '早餐', 1),
('糯米鸡', 36, 1.50, 220, 5.0, 6.0, 35, 2, '早餐', 1),
('油条', 36, 2.00, 200, 4.0, 15.0, 18, 0, '早餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('清炒小白菜', 37, 2.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('清炒大白菜', 37, 2.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('清炒豆芽', 37, 2.00, 60, 3.0, 1.0, 6, 2, '减脂', 1),
('清炒包菜', 37, 2.00, 55, 2.5, 0.8, 6, 2, '减脂', 1),
('时令蔬菜', 37, 3.00, 70, 3.0, 1.0, 7, 3, '减脂', 1),
('千张肉丝', 37, 4.00, 200, 15.0, 10.0, 8, 2, '午餐', 1),
('青豆鸡丁', 37, 6.00, 250, 20.0, 12.0, 10, 3, '午餐', 1),
('螺丝椒小炒肉', 37, 6.00, 300, 18.0, 18.0, 8, 2, '午餐', 1),
('小炒鸭肠', 37, 6.00, 220, 15.0, 15.0, 5, 1, '午餐', 1),
('清汤猪肉丸', 37, 6.00, 200, 18.0, 12.0, 5, 1, '午餐', 1),
('椒盐鸭', 37, 7.00, 350, 20.0, 22.0, 8, 1, '午餐', 1),
('板栗烧鸡', 37, 7.00, 320, 22.0, 15.0, 15, 5, '午餐', 1),
('红烧大骨', 37, 7.00, 380, 20.0, 25.0, 10, 2, '午餐', 1),
('回锅牛肉', 37, 8.00, 350, 25.0, 20.0, 8, 1, '午餐', 1),
('萝卜烧牛腩', 37, 8.00, 320, 22.0, 18.0, 10, 3, '午餐', 1),
('烧蹄花', 37, 8.00, 380, 18.0, 28.0, 8, 1, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('鸡肉串', 38, 1.00, 60, 4.0, 3.0, 1, 0, '解馋', 1),
('猪肉串', 38, 2.00, 80, 5.0, 5.0, 1, 0, '解馋', 1),
('五花肉串', 38, 2.00, 100, 4.0, 8.0, 1, 0, '解馋', 1),
('烤面筋', 38, 2.00, 80, 3.0, 2.0, 12, 0, '解馋', 1),
('烤馒头', 38, 2.00, 120, 3.0, 3.0, 20, 0, '解馋', 1),
('烤脆骨', 38, 3.00, 70, 6.0, 4.0, 1, 0, '解馋', 1),
('烤苕皮', 38, 4.00, 150, 2.0, 5.0, 20, 0, '解馋', 1),
('烤玉米粒', 38, 5.00, 100, 3.0, 1.0, 20, 5, '解馋', 1),
('烤腊肠串', 38, 5.00, 120, 5.0, 8.0, 3, 1, '解馋', 1),
('炒花饭', 38, 8.00, 350, 10.0, 8.0, 55, 3, '午餐', 1),
('烤牛油', 38, 12.00, 200, 2.0, 20.0, 1, 0, '解馋', 1),
('烤肉狗', 38, 1.50, 70, 5.0, 4.0, 2, 1, '解馋', 1),
('牛肉串', 38, 3.00, 70, 6.0, 4.0, 1, 0, '解馋', 1),
('茄子串', 38, 1.00, 30, 1.0, 0.5, 5, 2, '解馋', 1),
('烤鸡胗', 38, 2.00, 60, 8.0, 2.0, 1, 0, '解馋', 1),
('烤蟹排', 38, 2.00, 80, 5.0, 4.0, 5, 1, '解馋', 1),
('小黄鱼', 38, 3.00, 80, 10.0, 3.0, 1, 0, '解馋', 1),
('烤鱿鱼', 38, 5.00, 70, 10.0, 2.0, 2, 0, '解馋', 1),
('烤鸡腿', 38, 5.00, 150, 20.0, 8.0, 1, 0, '解馋', 1),
('烤干子', 38, 6.00, 100, 8.0, 4.0, 3, 0, '解馋', 1),
('烤鲫鱼', 38, 10.00, 150, 20.0, 5.0, 1, 0, '解馋', 1),
('烤金针菇', 38, 5.00, 40, 2.0, 2.0, 5, 1, '解馋', 1),
('羊肉串', 38, 3.00, 70, 6.0, 4.0, 1, 0, '解馋', 1),
('黄瓜串', 38, 1.00, 10, 0.5, 0.1, 2, 1, '解馋', 1),
('烤年糕', 38, 2.00, 100, 2.0, 1.0, 20, 3, '解馋', 1),
('王中王火腿肠', 38, 3.00, 80, 3.0, 6.0, 2, 1, '解馋', 1),
('鹌鹑蛋', 38, 3.00, 70, 6.0, 5.0, 1, 0.5, '解馋', 1),
('烤韭菜', 38, 5.00, 30, 1.5, 0.5, 4, 1, '解馋', 1),
('烤鸡爪', 38, 5.00, 100, 12.0, 6.0, 1, 0, '解馋', 1),
('烤翅中', 38, 7.00, 120, 15.0, 8.0, 1, 0, '解馋', 1),
('烤鸭肠', 38, 10.00, 80, 10.0, 5.0, 1, 0, '解馋', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('麻辣烫/麻辣拌', 39, 1.78, 80, 5.0, 3.0, 8, 1, '午餐', 1),
('麻辣香锅素菜', 39, 1.50, 40, 2.0, 1.0, 5, 1, '午餐', 1),
('麻辣香锅荤菜', 39, 3.20, 80, 8.0, 5.0, 3, 0, '午餐', 1),
('麻辣香锅精品菜', 39, 4.80, 100, 10.0, 6.0, 4, 0, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('水饺', 40, 10.00, 350, 12.0, 10.0, 45, 1, '午餐', 1),
('牛肉饼', 40, 5.00, 200, 8.0, 10.0, 20, 1, '早餐', 1),
('绿豆汤', 40, 2.00, 60, 2.0, 0.3, 12, 4, '早餐', 1),
('营养粥', 40, 3.00, 80, 2.5, 1.0, 15, 3, '早餐', 1),
('黑芝麻汤圆', 40, 5.00, 250, 5.0, 8.0, 40, 15, '早餐', 1),
('鸡肉土豆粉', 40, 8.00, 350, 15.0, 8.0, 45, 2, '午餐', 1),
('鱼豆腐土豆粉', 40, 8.00, 360, 16.0, 8.5, 46, 2, '午餐', 1),
('番茄荷包蛋土豆粉', 40, 9.00, 380, 15.0, 9.0, 48, 5, '午餐', 1),
('三鲜土豆粉', 40, 10.00, 400, 18.0, 10.0, 47, 3, '午餐', 1),
('羊肉土豆粉', 40, 10.00, 420, 20.0, 11.0, 46, 3, '午餐', 1),
('肥牛土豆粉', 40, 10.00, 420, 22.0, 12.0, 45, 3, '午餐', 1),
('牛肉土豆粉', 40, 12.00, 450, 25.0, 13.0, 45, 3, '午餐', 1),
('酸菜鸡肉煲+米饭', 40, 12.00, 500, 20.0, 15.0, 55, 4, '午餐', 1),
('酸菜鱼煲+米饭', 40, 12.00, 480, 22.0, 14.0, 56, 4, '午餐', 1),
('酸菜酥肉煲+米饭', 40, 12.00, 520, 18.0, 18.0, 55, 4, '午餐', 1),
('酸菜肉煲+米饭', 40, 13.00, 530, 20.0, 19.0, 55, 4, '午餐', 1),
('酸菜肥牛煲+米饭', 40, 13.00, 550, 25.0, 18.0, 54, 4, '午餐', 1),
('酸菜排骨煲+米饭', 40, 14.00, 580, 22.0, 20.0, 55, 4, '午餐', 1),
('酸菜牛肉煲+米饭', 40, 15.00, 600, 28.0, 21.0, 54, 4, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('手撕包菜', 41, 3.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('麻婆豆腐', 41, 3.00, 120, 6.0, 8.0, 5, 1, '午餐', 1),
('蒸鸡蛋', 41, 3.00, 100, 8.0, 7.0, 1, 0.5, '早餐', 1),
('土豆丝', 41, 3.00, 60, 1.5, 0.5, 12, 1, '减脂', 1),
('蒸南瓜', 41, 3.00, 50, 1.0, 0.2, 12, 5, '减脂', 1),
('时令蔬菜', 41, 3.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('番茄炒蛋', 41, 4.00, 150, 8.0, 10.0, 5, 3, '午餐', 1),
('干锅花菜', 41, 4.00, 100, 3.0, 5.0, 8, 2, '午餐', 1),
('孜然土豆片', 41, 4.00, 80, 2.0, 3.0, 12, 1, '午餐', 1),
('豆角茄子', 41, 4.00, 90, 2.0, 5.0, 8, 2, '午餐', 1),
('清炒莴苣片', 41, 4.00, 40, 1.5, 0.5, 5, 2, '减脂', 1),
('清炒藕片', 41, 4.00, 60, 1.5, 0.5, 10, 3, '减脂', 1),
('玉米粒', 41, 4.00, 80, 3.0, 1.0, 15, 5, '减脂', 1),
('韭菜炒蛋', 41, 5.00, 150, 8.0, 10.0, 3, 1, '午餐', 1),
('木须炒蛋', 41, 5.00, 160, 9.0, 11.0, 3, 1, '午餐', 1),
('丝瓜炒蛋', 41, 5.00, 140, 8.0, 9.0, 4, 2, '午餐', 1),
('千张肉丝', 41, 5.00, 200, 15.0, 10.0, 8, 2, '午餐', 1),
('韭菜鸭血', 41, 5.00, 120, 10.0, 5.0, 3, 1, '午餐', 1),
('青椒炒火腿', 41, 5.00, 180, 10.0, 12.0, 5, 2, '午餐', 1),
('辣炒肉丸子', 41, 6.00, 250, 15.0, 15.0, 5, 1, '午餐', 1),
('鱼香肉丝', 41, 6.00, 220, 15.0, 12.0, 8, 2, '午餐', 1),
('宫保鸡丁', 41, 6.00, 250, 18.0, 12.0, 10, 3, '午餐', 1),
('胡萝卜肉片', 41, 6.00, 200, 15.0, 10.0, 8, 3, '午餐', 1),
('土豆烧鸡', 41, 6.00, 250, 18.0, 12.0, 15, 3, '午餐', 1),
('蒜苔肉丝', 41, 6.00, 210, 16.0, 11.0, 7, 2, '午餐', 1),
('香酥藕夹', 41, 6.00, 200, 5.0, 12.0, 15, 3, '午餐', 1),
('小酥肉', 41, 7.00, 250, 12.0, 18.0, 10, 1, '午餐', 1),
('糖醋鸡米花', 41, 7.00, 280, 15.0, 18.0, 12, 5, '午餐', 1),
('小炒蒙古肉', 41, 7.00, 250, 18.0, 15.0, 5, 1, '午餐', 1),
('杏鲍菇肉片', 41, 7.00, 220, 17.0, 13.0, 6, 2, '午餐', 1),
('农家小炒肉', 41, 7.00, 260, 18.0, 17.0, 5, 1, '午餐', 1),
('小炒香肠', 41, 7.00, 280, 12.0, 20.0, 6, 2, '午餐', 1),
('小炒鸡杂', 41, 8.00, 250, 18.0, 16.0, 5, 1, '午餐', 1),
('土豆红烧肉', 41, 8.00, 300, 15.0, 22.0, 15, 3, '午餐', 1),
('干锅鸡块', 41, 8.00, 300, 22.0, 18.0, 10, 2, '午餐', 1),
('红烧鸭', 41, 8.00, 280, 20.0, 18.0, 8, 1, '午餐', 1),
('奥尔良鸡腿', 41, 8.00, 250, 25.0, 12.0, 5, 1, '午餐', 1),
('胡萝卜烧牛腩', 41, 8.00, 300, 22.0, 18.0, 8, 3, '午餐', 1),
('照烧鸡腿', 41, 8.00, 260, 26.0, 13.0, 5, 1, '午餐', 1),
('番茄肥牛', 41, 8.00, 250, 20.0, 15.0, 6, 3, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('手撕包菜', 42, 3.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('土豆丝', 42, 3.00, 60, 1.5, 0.5, 12, 1, '减脂', 1),
('时令蔬菜', 42, 3.00, 50, 2.0, 0.5, 5, 2, '减脂', 1),
('麻婆豆腐', 42, 3.00, 120, 6.0, 8.0, 5, 1, '午餐', 1),
('番茄炒蛋', 42, 3.50, 150, 8.0, 10.0, 5, 3, '午餐', 1),
('花菜', 42, 3.50, 80, 2.0, 3.0, 8, 2, '午餐', 1),
('酸辣藕丁', 42, 4.00, 70, 1.5, 0.5, 10, 3, '减脂', 1),
('清炒莴苣', 42, 4.00, 40, 1.5, 0.5, 5, 2, '减脂', 1),
('玉米粒', 42, 4.00, 80, 3.0, 1.0, 15, 5, '减脂', 1),
('韭菜鸡蛋', 42, 4.00, 150, 8.0, 10.0, 3, 1, '午餐', 1),
('平菇炒蛋', 42, 5.00, 160, 9.0, 11.0, 3, 1, '午餐', 1),
('韭菜鸭血', 42, 5.00, 120, 10.0, 5.0, 3, 1, '午餐', 1),
('丝瓜炒蛋', 42, 5.00, 140, 8.0, 9.0, 4, 2, '午餐', 1),
('鱼香肉丝', 42, 6.00, 220, 15.0, 12.0, 8, 2, '午餐', 1),
('香酥藕夹', 42, 6.00, 200, 5.0, 12.0, 15, 3, '午餐', 1),
('茭白炒肉', 42, 6.00, 200, 15.0, 10.0, 7, 2, '午餐', 1),
('鸡柳薯条', 42, 6.00, 250, 12.0, 15.0, 15, 1, '午餐', 1),
('外婆菜', 42, 6.00, 180, 8.0, 12.0, 10, 2, '午餐', 1),
('干煸杏鲍菇', 42, 7.00, 150, 5.0, 8.0, 10, 2, '午餐', 1),
('蒜苔香肠', 42, 7.00, 280, 12.0, 20.0, 6, 2, '午餐', 1),
('木须肉', 42, 7.00, 220, 16.0, 13.0, 7, 2, '午餐', 1),
('回锅肉', 42, 7.00, 300, 15.0, 22.0, 6, 1, '午餐', 1),
('青椒肉丝', 42, 7.00, 220, 16.0, 13.0, 7, 2, '午餐', 1),
('小炒蒙古肉', 42, 7.00, 250, 18.0, 15.0, 5, 1, '午餐', 1),
('农家小炒肉', 42, 7.00, 260, 18.0, 17.0, 5, 1, '午餐', 1),
('锅包肉', 42, 7.00, 300, 15.0, 18.0, 15, 3, '午餐', 1),
('干煸鸡块', 42, 7.00, 280, 20.0, 18.0, 10, 2, '午餐', 1),
('葱香鲫鱼', 42, 7.50, 200, 20.0, 8.0, 3, 1, '午餐', 1),
('土豆烧牛腩', 42, 8.00, 300, 22.0, 18.0, 10, 3, '午餐', 1),
('白斩鸡', 42, 8.00, 220, 25.0, 12.0, 2, 0, '午餐', 1),
('可乐鸡', 42, 8.00, 280, 20.0, 15.0, 10, 5, '午餐', 1),
('小炒鸡杂', 42, 8.00, 250, 18.0, 16.0, 5, 1, '午餐', 1),
('外婆烧肉', 42, 8.00, 320, 15.0, 25.0, 8, 2, '午餐', 1),
('烤鸭', 42, 8.00, 250, 18.0, 18.0, 5, 1, '午餐', 1),
('毛血旺', 42, 8.00, 300, 20.0, 20.0, 8, 2, '午餐', 1),
('金汤肥牛', 42, 8.00, 250, 20.0, 15.0, 6, 3, '午餐', 1),
('酱烧黑鸭', 42, 8.00, 280, 20.0, 18.0, 8, 2, '午餐', 1),
('香酥鸡腿', 42, 8.00, 260, 22.0, 15.0, 5, 1, '午餐', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('素面(粉)', 43, 5.00, 300, 8.0, 3.0, 60, 2, '早餐', 1),
('炸酱面(粉)', 43, 6.00, 380, 12.0, 10.0, 62, 5, '午餐', 1),
('牛腩面(粉)', 43, 12.00, 450, 20.0, 15.0, 55, 2, '午餐', 1),
('肥肠面(粉)', 43, 13.00, 500, 18.0, 25.0, 55, 2, '午餐', 1),
('牛肉面(粉)', 43, 13.00, 480, 25.0, 18.0, 55, 2, '午餐', 1),
('牛杂面(粉)', 43, 13.00, 460, 22.0, 18.0, 55, 2, '午餐', 1),
('牛筋面(粉)', 43, 13.00, 470, 20.0, 20.0, 55, 2, '午餐', 1),
('牛骨面(粉)', 43, 16.00, 520, 22.0, 22.0, 55, 2, '午餐', 1),
('土豆丝夹馍', 43, 4.00, 200, 5.0, 5.0, 30, 2, '早餐', 1),
('香肠夹馍', 43, 5.00, 250, 8.0, 12.0, 25, 2, '早餐', 1),
('鸡蛋夹馍', 43, 5.00, 220, 10.0, 8.0, 25, 2, '早餐', 1),
('经典肉夹馍', 43, 7.00, 300, 15.0, 18.0, 25, 2, '午餐', 1),
('肉夹蛋夹馍', 43, 8.00, 320, 18.0, 20.0, 25, 2, '午餐', 1),
('卤香干', 43, 1.00, 40, 3.0, 1.0, 3, 0, '小吃', 1),
('卤鸡蛋', 43, 1.50, 70, 6.0, 5.0, 1, 0.5, '小吃', 1),
('卤香肠', 43, 1.50, 80, 3.0, 6.0, 2, 0.5, '小吃', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('铁板香酥鸡米饭', 44, 12.00, 500, 20.0, 18.0, 55, 3, '午餐', 1),
('铁板藤椒鸡排饭', 44, 12.00, 520, 22.0, 19.0, 55, 3, '午餐', 1),
('铁板台湾卤肉饭', 44, 12.00, 550, 18.0, 22.0, 55, 3, '午餐', 1),
('铁板肉排饭', 44, 12.00, 530, 20.0, 20.0, 55, 3, '午餐', 1),
('铁板孜然肥牛饭', 44, 13.00, 580, 25.0, 22.0, 55, 3, '午餐', 1),
('铁板香辣鸡排饭', 44, 13.00, 530, 22.0, 20.0, 55, 3, '午餐', 1),
('铁板腿排饭', 44, 13.00, 540, 23.0, 21.0, 55, 3, '午餐', 1),
('铁板烟熏鸭脯饭', 44, 14.00, 560, 20.0, 23.0, 55, 3, '午餐', 1),
('铁板酱汁猪扒饭', 44, 13.00, 550, 22.0, 22.0, 55, 3, '午餐', 1),
('铁板肥牛扒饭', 44, 15.00, 600, 28.0, 24.0, 55, 3, '午餐', 1),
('铁板黑椒牛扒饭', 44, 15.00, 620, 30.0, 25.0, 55, 3, '午餐', 1),
('雪花肉排', 44, 3.00, 120, 8.0, 8.0, 2, 0, '小吃', 1),
('铁板烤热狗肠', 44, 1.50, 80, 3.0, 6.0, 2, 0.5, '小吃', 1),
('煎鸡蛋', 44, 1.50, 90, 7.0, 7.0, 1, 0.5, '小吃', 1),
('香煎培根', 44, 2.00, 100, 4.0, 9.0, 1, 0, '小吃', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('红豆奶茶', 45, 5.00, 200, 3.0, 8.0, 28, 20, '解馋', 1),
('珍珠奶茶', 45, 5.00, 220, 3.0, 8.0, 32, 22, '解馋', 1),
('抹茶奶绿', 45, 5.00, 180, 3.0, 7.0, 25, 18, '解馋', 1),
('香芋奶茶', 45, 5.00, 210, 3.0, 8.0, 30, 21, '解馋', 1),
('椰果奶茶', 45, 5.00, 200, 3.0, 8.0, 28, 20, '解馋', 1),
('椰奶', 45, 5.00, 130, 3.0, 5.0, 16, 8, '早餐', 1),
('草莓桑葚奶优', 45, 6.00, 160, 4.0, 3.5, 20, 15, '解馋', 1),
('黄桃芒果奶优', 45, 6.00, 165, 4.0, 3.5, 21, 16, '解馋', 1),
('原味酸奶', 45, 6.00, 120, 4.0, 3.5, 15, 10, '补充蛋白', 1),
('草莓酸奶', 45, 6.00, 140, 4.0, 3.5, 18, 13, '补充蛋白', 1),
('芒果酸奶', 45, 6.00, 145, 4.0, 3.5, 19, 14, '补充蛋白', 1),
('桂花米酿啵啵牛乳茶', 45, 7.00, 220, 4.0, 6.0, 30, 22, '解馋', 1),
('棒打柠檬', 45, 4.00, 40, 0.1, 0, 10, 8, '解渴', 1),
('茉莉绿茶', 45, 4.00, 20, 0.1, 0, 5, 4, '解渴', 1),
('柠檬红茶', 45, 5.00, 90, 0.5, 0, 23, 20, '解渴', 1),
('泰式柠檬茶', 45, 5.00, 95, 0.5, 0, 24, 21, '解渴', 1),
('柠七', 45, 6.00, 100, 0.1, 0, 25, 23, '解渴', 1),
('柠乐', 45, 6.00, 100, 0.1, 0, 25, 23, '解渴', 1),
('蜂蜜柚子茶', 45, 6.00, 130, 0.5, 0, 32, 28, '润喉', 1),
('桃桃鲜果茶', 45, 6.00, 110, 0.9, 0.3, 27, 24, '解馋', 1),
('柚柚小吊梨', 45, 6.00, 100, 0.5, 0, 25, 20, '润喉', 1),
('多肉葡萄', 45, 6.00, 120, 1.0, 0.5, 30, 25, '解馋', 1),
('柠檬百香果', 45, 6.00, 75, 0.5, 0, 18, 16, '开胃', 1),
('杨枝甘露', 45, 8.00, 180, 3.0, 6.0, 25, 20, '解馋', 1),
('蜜桃乳酸菌', 45, 8.00, 120, 2.0, 3.0, 20, 15, '解馋', 1),
('草莓乳酸菌', 45, 8.00, 125, 2.0, 3.0, 21, 16, '解馋', 1),
('葡萄乳酸菌', 45, 8.00, 120, 2.0, 3.0, 20, 15, '解馋', 1),
('百香果乳酸菌', 45, 8.00, 115, 2.0, 3.0, 19, 14, '解馋', 1),
('美式咖啡', 45, 9.00, 5, 0.3, 0, 1, 0, '提神', 1),
('丝滑拿铁', 45, 10.00, 130, 4.0, 7.0, 10, 6, '提神', 1),
('双皮奶', 45, 4.00, 180, 4.0, 5.0, 25, 18, '解馋', 1),
('手工冰粉', 45, 6.00, 150, 2.0, 1.0, 35, 28, '解馋', 1),
('红糖豆花', 45, 8.00, 200, 5.0, 6.0, 30, 22, '解馋', 1),
('鲜榨橙汁', 45, 6.00, 80, 0.5, 0, 20, 18, '补充维C', 1),
('鲜榨芒果汁', 45, 6.00, 120, 1.0, 0.5, 30, 25, '解馋', 1),
('鲜榨猕猴桃汁', 45, 6.00, 70, 0.7, 0, 17, 15, '补充维C', 1),
('酸梅汁', 45, 2.00, 60, 0.2, 0, 15, 12, '开胃', 1),
('绿豆沙', 45, 3.00, 90, 3.0, 0.5, 18, 8, '清热', 1),
('绿豆汤', 45, 3.00, 60, 2.0, 0.3, 12, 4, '清热', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('兰州骨汤素面', 46, 6.00, 300, 8.0, 3.0, 60, 2, '早餐', 1),
('兰州骨汤牛肉面', 46, 12.00, 450, 20.0, 15.0, 55, 2, '午餐', 1),
('兰州骨汤牛肉面套餐', 46, 14.00, 500, 22.0, 17.0, 60, 3, '午餐', 1),
('番茄牛肉面', 46, 13.00, 480, 20.0, 14.0, 58, 6, '午餐', 1),
('番茄牛肉面套餐', 46, 15.00, 530, 22.0, 16.0, 63, 7, '午餐', 1),
('酸菜牛肉面', 46, 13.00, 470, 21.0, 15.0, 56, 3, '午餐', 1),
('酸菜牛肉面套餐', 46, 15.00, 520, 23.0, 17.0, 61, 4, '午餐', 1),
('特色拌面', 46, 14.00, 500, 18.0, 16.0, 62, 3, '午餐', 1),
('黑鸭腿捞面', 46, 11.00, 480, 25.0, 18.0, 55, 2, '午餐', 1),
('大盘鸡捞面', 46, 12.00, 520, 22.0, 18.0, 60, 3, '午餐', 1),
('咖喱鸡捞面', 46, 12.00, 500, 20.0, 16.0, 62, 5, '午餐', 1),
('卤鸡蛋', 46, 1.00, 70, 6.0, 5.0, 1, 0.5, '小吃', 1),
('卤香肠', 46, 2.00, 80, 3.0, 6.0, 2, 0.5, '小吃', 1),
('海鲜丸子', 46, 2.00, 60, 5.0, 3.0, 3, 0, '小吃', 1),
('卤黑鸭腿', 46, 7.00, 180, 15.0, 10.0, 2, 0, '小吃', 1);
INSERT INTO dish (dish_name, canteen_id, price, calories, protein, fat, carbs, sugar, fit_target, is_on_sale) VALUES
('香辣金钱蛋', 47, 10.00, 250, 12.0, 18.0, 5, 1, '午餐', 1),
('毛式红烧肉', 47, 13.00, 350, 15.0, 28.0, 8, 2, '午餐', 1),
('湖南辣椒炒肉', 47, 13.00, 300, 18.0, 22.0, 6, 2, '午餐', 1),
('酸辣鸡胗', 47, 13.00, 250, 20.0, 15.0, 5, 1, '午餐', 1),
('糯米笋炒肉', 47, 15.00, 320, 18.0, 20.0, 10, 2, '午餐', 1),
('小炒黄牛肉', 47, 15.00, 300, 25.0, 18.0, 5, 1, '午餐', 1),
('湖南口味虾', 47, 15.00, 280, 22.0, 16.0, 6, 1, '午餐', 1),
('两素套餐', 47, 7.00, 200, 6.0, 5.0, 30, 3, '午餐', 1),
('一荤一素套餐', 47, 8.00, 280, 12.0, 10.0, 30, 3, '午餐', 1),
('一荤两素套餐', 47, 10.00, 320, 15.0, 12.0, 35, 4, '午餐', 1),
('两荤一素套餐', 47, 12.00, 380, 20.0, 18.0, 35, 4, '午餐', 1),
('两荤两素套餐', 47, 14.00, 420, 22.0, 20.0, 40, 5, '午餐', 1),
('三荤套餐', 47, 15.00, 480, 25.0, 25.0, 35, 4, '午餐', 1);
INSERT INTO dish_category (cate_name) VALUES
('主食类'), ('面类'), ('快餐类'), ('烧烤类'), ('麻辣烫'), ('粥粉类'), ('饮品甜品'), ('早餐类'), ('减脂餐');

INSERT INTO tag (tag_name) VALUES
('清淡'), ('麻辣'), ('高蛋白'), ('减脂'), ('早餐'), ('午餐'), ('晚餐'), ('解馋'), ('主食'), ('汤面');

INSERT INTO user (username, password, phone, student_id, role) VALUES
('admin1','123456','13800000001','20250001','admin'),
('admin2','123456','13800000002','20250002','admin'),
('student1','123456','13800000003','20250003','user'),
('student2','123456','13800000004','20250004','user'),
('student3','123456','13800000005','20250005','user'),
('student4','123456','13800000006','20250006','user'),
('student5','123456','13800000007','20250007','user'),
('student6','123456','13800000008','20250008','user'),
('student7','123456','13800000009','20250009','user'),
('student8','123456','1380000010','20250010','user');

INSERT INTO user_profile (user_id, age, gender, height, weight, target, activity_level, taboo_foods) VALUES
(1,23,'男',176.00,72.50,'保持健康','中度','无'),
(2,24,'女',163.00,51.00,'塑形减脂','轻度','香菜,生冷'),
(3,20,'男',172.00,68.00,'增肌','高强度','无'),
(4,21,'女',160.00,53.00,'维持体重','轻度','辣,油炸'),
(5,22,'男',178.00,75.00,'减脂塑形','中度','肥肉'),
(6,19,'女',166.00,50.00,'瘦身','低强度','海鲜'),
(7,20,'男',170.00,66.00,'均衡饮食','中度','无'),
(8,21,'女',162.00,52.00,'调理身体','低强度','甜食'),
(9,22,'男',174.00,70.00,'增肌减脂','高强度','内脏'),
(10,20,'女',164.00,54.00,'保持身材','中度','榴莲');

INSERT INTO article (title, content) VALUES
('健康饮食七大原则','1.三餐规律 2.少油少盐 3.荤素搭配 4.多吃粗粮 5.足量饮水 6.少吃精加工食品 7.控制糖分摄入'),
('大学生减脂饮食指南','早餐吃优质蛋白+主食，午餐正常荤素搭配，晚餐少吃主食多蔬菜，拒绝夜宵油炸。');

INSERT INTO dish_comment (dish_id, user_id, score, content) VALUES
(1,3,5,'味道很好，分量足，很适合减脂吃'),
(2,4,4,'口味不错，稍微有点咸'),
(3,5,5,'性价比很高，经常回购');

SELECT COUNT(*) FROM dish WHERE canteen_id BETWEEN 30 AND 48;

-- 修正荟园一楼
UPDATE canteen
SET canteen_name = REPLACE(canteen_name, '荟园一楼·', ''),
    location = REPLACE(location, '华中农业大学', '')
WHERE location LIKE '%荟园一楼%';

-- 修正荟园二楼
UPDATE canteen
SET canteen_name = REPLACE(canteen_name, '荟园二楼·', ''),
    location = REPLACE(location, '华中农业大学', '')
WHERE location LIKE '%荟园二楼%';

-- 修正荟园三楼
UPDATE canteen
SET canteen_name = REPLACE(canteen_name, '荟园三楼·', ''),
    location = REPLACE(location, '华中农业大学', '')
WHERE location LIKE '%荟园三楼%';








































