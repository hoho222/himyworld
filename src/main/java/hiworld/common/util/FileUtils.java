package hiworld.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	//기본 이미지 업로드 filePath
	private static final String filePath_default = "D:\\Project\\workspace\\HiWorld\\src\\main\\webapp\\resources\\default\\";
	
	//어드민 배너등록 시 타는 filePath
	private static final String filePath_banner = "D:\\Project\\workspace\\HiWorld\\src\\main\\webapp\\resources\\banners\\";
	
	//프론트 추억쌓기 이미지등록 시 타는 filePath
	private static final String filePath_location = "D:\\Project\\workspace\\HiWorld\\src\\main\\webapp\\resources\\locationImgs\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
        
        //myLoaction쪽에서 이미지 등록할때를 구분해주기 위함
        String locationGB = (map.get("locationGB")).toString();
         
        //작성자 값을 얻기위해 세션에서 id가져옴
  		HttpSession session = request.getSession();
  		String admin_id = (String)session.getAttribute("loginId");
         
        File file = new File(filePath_default);
        
        if("mylocation".equals(locationGB)){
        	file = new File(filePath_location);
        } else if ("banner".equals(locationGB)){
        	file = new File(filePath_banner);
        }
        
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath_default + storedFileName);
                
                if("mylocation".equals(locationGB)){
                	file = new File(filePath_location + storedFileName);
                } else if("banner".equals(locationGB)){
                	file = new File(filePath_banner + storedFileName);
                }
                
                multipartFile.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
                
                listMap.put("original_file_name", originalFileName);
                listMap.put("stored_file_name", storedFileName);
                listMap.put("file_size", multipartFile.getSize());
                
                if("mylocation".equals(locationGB)){
                	listMap.put("filePath", filePath_location);
                	listMap.put("writerId", admin_id);
                	listMap.put("title", (map.get("title")).toString());
                	listMap.put("content", (map.get("content")).toString());
                	listMap.put("latitude", (map.get("lat")).toString());
                	listMap.put("longitude", (map.get("lng")).toString());
                } else if("banner".equals(locationGB)){
                	listMap.put("filePath", filePath_banner);
                	listMap.put("admin_id", admin_id);
	                listMap.put("go_url", (map.get("gourl")).toString());
	        		listMap.put("startdate", (map.get("startdate")).toString());
	        		listMap.put("enddate", (map.get("enddate")).toString());
	        		listMap.put("display_yn", (map.get("display_yn")).toString());
                } else {
                	listMap.put("filePath", filePath_default);
                	listMap.put("admin_id", admin_id);
	                listMap.put("go_url", (map.get("gourl")).toString());
	        		listMap.put("startdate", (map.get("startdate")).toString());
	        		listMap.put("enddate", (map.get("enddate")).toString());
	        		listMap.put("display_yn", (map.get("display_yn")).toString());
                }
                
                list.add(listMap);
            }
        }
        return list;
    }

}
