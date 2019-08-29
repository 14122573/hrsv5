package hrds.codes;
/**Created by automatic  */
/**代码类型名：权限类型  */
public enum AuthType {
	/**允许<YunXu>  */
	YunXu("1","允许","19","权限类型"),
	/**不允许<BuYunXu>  */
	BuYunXu("2","不允许","19","权限类型"),
	/**一次<YiCi>  */
	YiCi("3","一次","19","权限类型"),
	/**申请<ShenQing>  */
	ShenQing("0","申请","19","权限类型");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	AuthType(String code,String value,String catCode,String catValue){
		this.code = code;
		this.value = value;
		this.catCode = catCode;
		this.catValue = catValue;
	}
	public String getCode(){return code;}
	public String getValue(){return value;}
	public String getCatCode(){return catCode;}
	public String getCatValue(){return catValue;}

	/**根据指定的代码值转换成中文名字
	* @param code   本代码的代码值
	* @return
	*/
	public static String getValue(String code) {
		for (AuthType typeCode : AuthType.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode.value;
			}
		}
		return null;
	}

	/**根据指定的代码值转换成对象
	* @param code   本代码的代码值
	* @return
	*/
	public static AuthType getCodeObj(String code) {
		for (AuthType typeCode : AuthType.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode;
			}
		}
		return null;
	}

	/**
	* 获取代码项的中文类名名称
	* @return
	*/
	public static String getObjCatValue(){
		return AuthType.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return AuthType.values()[0].getCatCode();
	}
}
