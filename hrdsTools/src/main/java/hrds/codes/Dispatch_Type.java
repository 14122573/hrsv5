package hrds.codes;
/**Created by automatic  */
/**代码类型名：ETL调度类型  */
public enum Dispatch_Type {
	/**批前(B)<BEFORE>  */
	BEFORE("B","批前(B)","108","ETL调度类型"),
	/**依赖触发(D)<DEPENDENCE>  */
	DEPENDENCE("D","依赖触发(D)","108","ETL调度类型"),
	/**定时T+1触发(T)<TIMING>  */
	TIMING("T","定时T+1触发(T)","108","ETL调度类型"),
	/**定时T+0触发(Z)<ZTIMING>  */
	ZTIMING("Z","定时T+0触发(Z)","108","ETL调度类型"),
	/**批后(A)<AFTER>  */
	AFTER("A","批后(A)","108","ETL调度类型");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	Dispatch_Type(String code,String value,String catCode,String catValue){
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
		for (Dispatch_Type typeCode : Dispatch_Type.values()) {
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
	public static Dispatch_Type getCodeObj(String code) {
		for (Dispatch_Type typeCode : Dispatch_Type.values()) {
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
		return Dispatch_Type.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return Dispatch_Type.values()[0].getCatCode();
	}
}
