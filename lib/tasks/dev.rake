# -*- encoding : utf-8 -*-

namespace :dev do

  desc 'build suppliers ...'
  task build: [
    :create_activity_types,
    :create_supplier_categories,
    :create_suppliers,
    :create_vip_users,
    :create_activity_consumes,
    #:create_activity_notices,
  ]

  desc 'created activity_types'
  task :create_activity_types => :environment do
    puts 'Starting create activity_types ******'
    [
      { name: "微官网", is_show: false, sort: 1 },
      { name: "微会员卡", is_show: false, sort: 2 },
      { name: "优惠券", is_show: true, sort: 3 },
      { name: "刮刮乐抽奖活动", is_show: true, sort: 3 },
      { name: "大转盘抽奖活动", is_show: true, sort: 3 }
    ].each do |attrs|
      activity_type = ActivityType.where(name: attrs[:name]).first_or_create(is_show: attrs[:is_show], sort: attrs[:sort])
      puts "created activity_type: #{activity_type.id} - #{activity_type.name}"
    end
    puts 'Done!'
  end


  desc 'created supplier_categories'
  task :create_supplier_categories => :environment do
    puts 'Starting create supplier_categories ******'
    {
      { name: "美食", sort: 1} => [{ name: "本帮江浙菜", sort: 1},{ name: "川菜", sort: 2},{ name: "粤菜", sort: 3},{ name: "湘菜", sort: 4},{ name: "贵州菜", sort: 5},{ name: "东北菜", sort: 6},{ name: "台湾菜", sort: 7},{ name: "新疆/清真菜", sort: 8},{ name: "西北菜", sort: 9},{ name: "素菜", sort: 10},{ name: "火锅", sort: 11},{ name: "自助餐", sort: 12},{ name: "小吃快餐", sort: 13},{ name: "日本", sort: 14},{ name: "韩国料理", sort: 15},{ name: "东南亚菜", sort: 16},{ name: "西餐", sort: 17},{ name: "面包甜点", sort: 18},{ name: "其他", sort: 19}],
      { name: "休闲娱乐", sort: 2} => [{ name: "密室", sort: 1},{ name: "咖啡厅", sort: 2},{ name: "酒吧", sort: 3},{ name: "茶馆", sort: 4},{ name: "KTV", sort: 5},{ name: "电影院", sort: 6},{ name: "文化艺术", sort: 7},{ name: "景点/郊游", sort: 8},{ name: "公园", sort: 9},{ name: "足疗按摩", sort: 10},{ name: "洗浴", sort: 11},{ name: "游乐游艺", sort: 12},{ name: "桌球", sort: 13},{ name: "桌面游戏", sort: 14},{ name: "DIY手工坊", sort: 15},{ name: "其他", sort: 16}],
      { name: "购物", sort: 3} => [{ name: "综合商场", sort: 1},{ name: "食品茶酒", sort: 2},{ name: "服饰鞋包", sort: 3},{ name: "珠宝饰品", sort: 4},{ name: "化妆品", sort: 5},{ name: "运动户外", sort: 6},{ name: "亲子购物", sort: 7},{ name: "品牌折扣店", sort: 8},{ name: "数码家电", sort: 9},{ name: "家居建材", sort: 10},{ name: "特色集市", sort: 11},{ name: "书店", sort: 12},{ name: "花店", sort: 13},{ name: "眼镜店", sort: 14},{ name: "超市/便利店", sort: 15},{ name: "药店", sort: 16},{ name: "其他", sort: 17}],
      { name: "丽人", sort: 4} => [{ name: "美发", sort: 1},{ name: "美容/SPA", sort: 2},{ name: "化妆品", sort: 3},{ name: "瘦身纤体", sort: 4},{ name: "美甲", sort: 5},{ name: "瑜伽", sort: 6},{ name: "舞蹈", sort: 7},{ name: "个性写真", sort: 8},{ name: "整形", sort: 9},{ name: "齿科", sort: 10},{ name: "其他", sort: 11}],
      { name: "结婚", sort: 5} => [{ name: "婚纱摄影", sort: 1},{ name: "婚宴", sort: 2},{ name: "婚戒首饰", sort: 3},{ name: "婚纱礼服", sort: 4},{ name: "婚庆公司", sort: 5},{ name: "彩妆造型", sort: 6},{ name: "司仪主持", sort: 7},{ name: "婚礼跟拍", sort: 8},{ name: "婚车租赁", sort: 9},{ name: "婚礼小商品", sort: 10},{ name: "婚房装修", sort: 11},{ name: "其他", sort: 12}],
      { name: "亲子", sort: 6} => [{ name: "幼儿教育", sort: 1},{ name: "亲子摄影", sort: 2},{ name: "亲子游乐", sort: 3},{ name: "亲子购物", sort: 4},{ name: "孕产护理", sort: 5},{ name: "其他", sort: 6}],
      { name: "运动健身", sort: 7} => [{ name: "游泳馆", sort: 1},{ name: "羽毛球馆", sort: 2},{ name: "健身中心", sort: 3},{ name: "瑜伽", sort: 4},{ name: "舞蹈", sort: 5},{ name: "篮球场", sort: 6},{ name: "网球场", sort: 7},{ name: "足球场", sort: 8},{ name: "高尔夫场", sort: 9},{ name: "保龄球馆", sort: 10},{ name: "桌球馆", sort: 11},{ name: "乒乓球馆", sort: 12},{ name: "武术场馆", sort: 13},{ name: "体育场馆", sort: 14},{ name: "其他", sort: 15}],
      { name: "酒店", sort: 8} => [{ name: "五星级酒店", sort: 1},{ name: "四星级酒店", sort: 2},{ name: "三星级酒店", sort: 3},{ name: "经济型酒店", sort: 4},{ name: "公寓式酒店", sort: 5},{ name: "精品酒店", sort: 6},{ name: "青年旅舍", sort: 7},{ name: "度假村", sort: 8},{ name: "其他", sort: 9}],
      { name: "爱车", sort: 9} => [{ name: "4S店/汽车销售", sort: 1},{ name: "汽车保险", sort: 2},{ name: "维修保养", sort: 3},{ name: "配件/车饰", sort: 4},{ name: "驾校", sort: 5},{ name: "汽车租赁", sort: 6},{ name: "停车场", sort: 7},{ name: "加油站", sort: 8},{ name: "其他", sort: 9}],
      { name: "生活服务", sort: 10} => [{ name: "旅行社", sort: 1},{ name: "培训", sort: 2},{ name: "室内装潢", sort: 3},{ name: "宠物", sort: 4},{ name: "齿科", sort: 5},{ name: "快照/冲印", sort: 6},{ name: "家政", sort: 7},{ name: "银行", sort: 8},{ name: "学校", sort: 9},{ name: "团购网站", sort: 10},{ name: "其他", sort: 11}]
    }.each do |category, sub_cates|
      supplier_category = SupplierCategory.where(name: category[:name]).first_or_create(name: category[:name], sort: category[:sort])
      puts "created supplier_categories supper_cate: #{supplier_category.id} - #{supplier_category.name}"
      sub_cates.each do |sub_cate|
        sub_category = SupplierCategory.where(name: sub_cate[:name], parent_id: supplier_category.id).first_or_create(parent_id: supplier_category.id, name: sub_cate[:name], sort: sub_cate[:sort])
        puts "created supplier_categories sub_cate: #{sub_category.id} - #{sub_category.name}"
      end
    end
    puts 'Done!'
  end

  desc 'created suppliers'
  task :create_suppliers => :environment do
    puts 'Starting create suppliers ******'
    if Supplier.count == 0
      supplier = Supplier.where(name: 'uzhe').first_or_create(nickname: 'uzhe', password: 111111, password_confirmation: 111111)

      wx_mp_user = supplier.wx_mp_users.where(name: 'uzhe').first_or_create

      puts "created supplier: #{supplier.name}) wx_mp_user #{wx_mp_user.name}"
    end
    puts 'Done!'
  end

  desc 'created vip_users'
  task :create_vip_users => :environment do
    puts 'Starting create vip_users ******'
    [
      { name: "张三", mobile: "13456772822" , address: "浙江", supplier_id: 1, wx_mp_user_id: 2, wx_user_id: 3 },
      { name: "李四", mobile: "13456772222" , address: "江西", supplier_id: 1, wx_mp_user_id: 2, wx_user_id: 3 },
      { name: "王五", mobile: "13452172822" , address: "安徽", supplier_id: 1, wx_mp_user_id: 2, wx_user_id: 3 },
      { name: "杨六", mobile: "13452122822" , address: "福建", supplier_id: 1, wx_mp_user_id: 2, wx_user_id: 3 },
      { name: "陈七", mobile: "13456771112" , address: "广州", supplier_id: 1, wx_mp_user_id: 2, wx_user_id: 3 }
    ].each do |attrs|
      vip_user = VipUser.where(name: attrs[:name]).first_or_create(mobile: attrs[:mobile], address: attrs[:address],supplier_id: attrs[:supplier_id],wx_mp_user_id: attrs[:wx_mp_user_id],wx_user_id: attrs[:wx_user_id])
      puts "created vip_user: #{vip_user.id} - #{vip_user.name}"
    end
    puts 'Done!'
  end

  desc 'created activity_consumes'
  task :create_activity_consumes => :environment do
    puts 'Starting create activity_consumes ******'
    [
      { wx_mp_user_id: 1, activity_id: 5, wx_user_id: 3, code: 12345, status: 1 },
      { wx_mp_user_id: 1, activity_id: 5, wx_user_id: 3, code: 12323, status: 1 },
      { wx_mp_user_id: 1, activity_id: 5, wx_user_id: 3, code: 12342, status: 1 },
      { wx_mp_user_id: 1, activity_id: 5, wx_user_id: 3, code: 12312, status: 1 },
    ].each do |attrs|
      activity_consume = ActivityConsume.where(code: attrs[:code]).first_or_create(code: attrs[:code], status: attrs[:status],wx_mp_user_id: attrs[:wx_mp_user_id],activity_id: attrs[:activity_id],wx_user_id: attrs[:wx_user_id])
      puts "created activity_consume: #{activity_consume.id} - #{activity_consume.code}"
    end
    puts 'Done!'
  end

  desc 'created activity_notices'
  task :create_activity_notices => :environment do
    puts 'Starting create activity_notices ******'
    [
      { activity_type_id: 1 , title: "欢迎进入{wx_mp_user.name}的微官网", pic: "/public/uploads/activity_pics/default/site.png", description: "{supplier.name},更多精彩呈现,点击进入!", activity_status: 1 },

      { activity_type_id: 2 , title: "申请微信会员卡", pic: "/public/uploads/activity_pics/default/vip.png", description: "您尚未申请会员特权,快来点击申领吧!!", activity_status: 0 },
      { activity_type_id: 2 , title: "尊敬的会员{}", pic: "/public/uploads/activity_pics/default/vip.png", description: "尊敬的会员{},您的会员卡号为{},快来点击查看优惠信息吧!!", activity_status: 1 },

      { activity_type_id: 3 , title: "活动即将开始", pic: "/public/uploads/activity_pics/default/yhq.jpg", description: "活动说明", activity_status: 0 },
      { activity_type_id: 3 , title: "中奖公告", pic: "/public/uploads/activity_pics/default/zhongjiang.jpg", description: "你获得的SN码为:{activity_con},了解优惠券特权请点击页面查看详情~", activity_status: 1 },
      { activity_type_id: 3 , title: "活动已经结束", pic: "/public/uploads/activity_pics/default//public/uploads/activity_pics/default/jieshu.jpg", description: "亲，下次早点哦~请继续关注我们的后续活动", activity_status: -1 },

      { activity_type_id: 4 , title: "活动即将开始", pic: "/public/uploads/activity_pics/default/ggl.jpg", description: "活动说明", activity_status: 0 },
      { activity_type_id: 4 , title: "活动开始，请进入页面开始刮奖", pic: "/public/uploads/activity_pics/default/gglks.jpg", description: "请点击进入刮刮卡活动页面", activity_status: 1 },

      { activity_type_id: 5 , title: "活动开始，请进入页面开始抽奖", pic: "/public/uploads/activity_pics/default/dzp.jpg", description: "请点击进入幸运大转盘活动页面", activity_status: 1 },
      { activity_type_id: 5 , title: "活动即将开始", pic: "dzpks.jpg", description: "活动说明", activity_status: 0 }
    ].each do |attrs|
      activity_notice = ActivityNotice.where(activity_id: 0, activity_type_id: attrs[:activity_type_id], activity_status: attrs[:activity_status]).first_or_create(wx_mp_user_id: 0, activity_id: 0, activity_type_id: attrs[:activity_type_id], title: attrs[:title],pic: attrs[:pic],description: attrs[:description],activity_status: attrs[:activity_status])
      puts "created activity_notice: #{activity_notice.id} - #{activity_notice.activity_type_id} - #{activity_notice.title}"
    end
    puts 'Done!'
  end

end
