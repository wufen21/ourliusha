package com.framework.loippi.controller.api.common;

public enum APIXerror {
	
	SYSTEM_ERROR_5000000("5000000","system error"),
	USER_NOT_LOGIN_5000001("5000001","用户未登录"),
	USER_SESS_EXPIRED_5000002("5000002","会话信息失败"),
	REQUIRE_PARAMETERS_LA("5000003","参数la为空"),
	NO_AUTH("5000004","无操作权限"),
	PARAM_INVALID_5000020("5000020","參數有誤"),
	MOBILE_INUSER_5000101("5000101","該手機已被註冊"),
	LOGIN_PASSWORD_ERROR_5000102("5000102","用戶登錄密碼錯誤"),
	OBJECT_IS_NOT_EXIST_5000103("5000103","用戶不存在"),
	OBJECT_IS_NOCONFORMITY_5000104("5000104","手機與用戶信息不符"),
	CODE_IS_NOT_EXIST_5000105("5000105","驗證碼不存在"),
	VALID_CODE_ERROR_5000106("5000106","驗證碼有誤"),
	USER_UNBIND_5000107("5000107","用戶未綁定"),
	NOT_MOBILE_5000108("5000108","該號碼非手機號"),
	OBJECT_IS_EXIST_5000109("5000109","用戶已經存在"),
	NICKNAME_IS_EXIST("5000110","用戶昵称已经存在"),
	NOT_MOBILE_5000111("5000111","无法添加好友"),
	WALLET_NOT_EXIST_50001009("50001009","用户钱包不存在"),
	RECHARGE_ERROR_50001010("50001010","充值失败"),
	RECHARGE_ACCOUNT_NOT_EXIST_50001011("50001011","充值账号不存在"),
	TO_PAY_ERROR_50001012("50001012","支付失败"),
	TO_DAILY_ATTENDANCE_ERROR_50001013("50001013","您今日已签过到"),
	MIN_WITHDRAW_ERROR_50001016("50001016","提现金额小于提现最低金额"),
	COUPON_NOT_ENOUGH_50001020("50001020","抵用券不足"),
	CREDIT_NOT_ENOUGH_50001021("50001021","积分不足"),
	WALLET_REDUCE_DEPOSIT_50001022("50001022","余额不足")
	;
/*
	SYSTEM_ERROR_EN("5000000","系統出錯en"),
	
	USER_SESS_EXPIRED("5000103","會話信息失效"),
	USER_NOT_LOGIN("5000104","用戶未登錄"),
	LOGIN_PASSWORD_ERROR("5000105","用戶登錄密碼錯誤"),
	OBJECT_IS_NOT_EXIST("5000106","用戶不存在"),
	LOGIN_ACCOUNT_DISABLED("5000107","用戶狀態為禁用"),
	PARAM_INVALID("5000108","參數有誤"),
	USER_UNBIND("5000109","用戶未綁定"),
	MOBILE_INUSER("5000111","該手機已被註冊"),
	VALID_CODE_ERROR("5000112","驗證碼有誤"),
	NOT_MOBILE("5000113","該號碼非手機號"),
	CODE_IS_NOT_EXIST("5000114","驗證碼不存在"),
	OBJECT_IS_NOT_MUSICIAN("5000115","用戶未實名認證"),
	OBJECT_IS_NOT_VERIFICATION("5000116","用戶未經過認證"),
	OBJECT_IS_EXIST("5000117","用戶已經存在"),
	OBJECT_IS_FINISH("5000118","優惠券已領取完"),
	OBJECT_IS_AMPLE("5000119","限領個數已夠"),
	VALID_RAMCODE_ERROR("5000120","圖形驗證碼有誤"),
	OBJECT_IS_NOCONFORMITY("5000121","手機與用戶信息不符"),
	
	Wallet_IS_NOT_EXIST("5001000","用戶錢包不存在"),

	CAN_NOT_COMMENT("5002000","不能回復自己的評論"),
	
	ALREADY_PRAISED("5002001","已點贊"),
	ALREADY_FOUCUS("5003001","已關注"),
	

	//訂單狀態
	Item_out("5010001","商品已下架"),
	OBJECT_ISNOT_EXIST("5010002","用戶不存在"),
	OBJECT_ISNOT_EXIST2("5010003","用戶不存在"),
	Order_status_notall2("5010004","仍有訂單音樂人未確認接單，請稍後付款"),
	Order_no_money("5010005","支付失敗"),
	Order_no_pay_password("5010006","您尚未設置支付密碼"),
	Order_error_password("5010007","支付密碼錯誤"),
	ORDER_STATUS_ERROR("5010008","接單失敗"),
	ORDER_BIDDING_STATUS_ERROR("5030009","搶單失敗"),
	
	//直播狀態
	Live_NO_Gene("5020001","商品已下架"),
	Live_NO_money("5020002","星幣不足，支付失敗"),
	Live_NO_purchase("5020003","商品已下架"),
	
	//用戶與音樂人端登錄
	USER_PENDING("5000113","暫未完成音樂人實名認證"),
	USER_ONAGREE("5000114","您的實名認證信息正在審核中"),
	USER_DISAGREE("5000115","您的實名認證信息審核失敗"),
	USER_SUCCESS("5000116","您的實名認證信息已通過"),
	
	
	
	//新版本错误码
	HAD_GOODS("6000101","商品類型已經存在"),
	NO_Live("6000102","喔喔，主播忙線中，要不要再試一次?"),

	//保證金
	DEPOSIT_NO_GIVE("5030001","首次發佈商品，未繳納保證金"),
	NOT_WALLET_REDUCE_DEPOSIT("5030002","保證金和錢包餘額不足，請走其他通道充值");

*/

	public String xCode;
	public String massage;
	
	APIXerror(String xCode, String massage) {
		this.xCode = xCode;
		this.massage = massage;
	}
	
	
	 /**
     * 不能為空
     */
    public static final int NOT_NULL = 5000002;
    /**
     * 長度太小
     */
    public static final int SIZE_TOO_MIN = 5000507;

}
