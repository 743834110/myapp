
-- 添加唯一性约束
alter table dictionary
add UNIQUE(code_item_id, code_id);