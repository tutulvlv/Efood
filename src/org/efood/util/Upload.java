package org.efood.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.efood.vo.Menu;

public class Upload {
	public void uploadImage(List<File> img,List<String> imgFileName,Menu menu) throws IOException{
		//得到工程保存图片的路径
        String root = ServletActionContext.getRequest().getRealPath("/images");

        System.out.println(img.size());
        //循环上传的文件
        for(int i = 0 ; i < img.size() ; i ++){
            InputStream is = new FileInputStream(img.get(i));
            menu.setImage("images/"+imgFileName.get(i));
            //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
            File destFile = new File(root,imgFileName.get(i));
            //把图片写入到上面设置的路径里
            OutputStream os = new FileOutputStream(destFile);
            byte[] buffer = new byte[128];
            int length  = 0 ;
            while((length = is.read(buffer))>0){
                os.write(buffer, 0, length);
            }
            is.close();
            os.close();
        }
	}
	public Upload() {}
}
