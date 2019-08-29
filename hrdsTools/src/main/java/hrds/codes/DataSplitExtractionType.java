package hrds.codes;
/**Created by automatic  */
/**代码类型名：数据拆分抽取类型  */
public enum DataSplitExtractionType {
	/**简单随机抽取<JianDanSuiJiChouQu>  */
	JianDanSuiJiChouQu("1","简单随机抽取","68","数据拆分抽取类型"),
	/**分层抽取<FenCengChouQu>  */
	FenCengChouQu("2","分层抽取","68","数据拆分抽取类型");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	DataSplitExtractionType(String code,String value,String catCode,String catValue){
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
		for (DataSplitExtractionType typeCode : DataSplitExtractionType.values()) {
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
	public static DataSplitExtractionType getCodeObj(String code) {
		for (DataSplitExtractionType typeCode : DataSplitExtractionType.values()) {
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
		return DataSplitExtractionType.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return DataSplitExtractionType.values()[0].getCatCode();
	}
}
