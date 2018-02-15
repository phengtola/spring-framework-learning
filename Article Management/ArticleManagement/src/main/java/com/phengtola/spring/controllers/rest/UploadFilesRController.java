package com.phengtola.spring.controllers.rest;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/v2/api/upload")
public class UploadFilesRController {

	@PostMapping
	public ResponseEntity<?> uploadFile(
			@RequestParam("file") MultipartFile uploadFile,
			HttpServletRequest request){
		
		if(uploadFile.isEmpty()){
			return new ResponseEntity("Please select a file", HttpStatus.OK);
		}
		try{
			String uploadedFolder = request.getSession().getServletContext().getRealPath("/resources/uploaded");

			saveUploadedFiles(Arrays.asList(uploadFile) , uploadedFolder);
			
		}catch(Exception e){
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<>("Successfully uploaded - " + uploadFile.getOriginalFilename()
				, new HttpHeaders(), HttpStatus.OK);
	}
	
	
	// Multiple file upload
    @PostMapping("/multiple-files")
    public ResponseEntity<?> uploadFileMultipleFiles(
            @RequestParam("extraField") String extraField,
            @RequestParam("files") MultipartFile[] uploadFiles,
			HttpServletRequest request) {


        // Get file name
        
    		
    	
    		if(uploadFiles.length == 0){
            return new ResponseEntity("please select a file!", HttpStatus.OK);
        }

        try {

			String uploadedFolder = request.getSession().getServletContext().getRealPath("/resources/uploaded");
			
        		saveUploadedFiles(Arrays.asList(uploadFiles) , uploadedFolder);

        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity("Successfully uploaded - "
                + uploadFiles.length, HttpStatus.OK);

    }
	
	private void saveUploadedFiles(List<MultipartFile> files , String uploadedFolder) throws IOException{

		for(MultipartFile file : files){
			
			if(file.isEmpty()){
				continue;
			}
			
			String randomFileName = UUID.randomUUID().toString()+".jpg";
			System.out.println(file.getSize());
			System.out.println(file.getOriginalFilename());
			
			byte[] bytes = file.getBytes();
			// TODO: write file to uploadedFolder
			Path path = Paths.get(uploadedFolder, randomFileName /* file.getOriginalFilename() */);
			Files.write(path, bytes);
		}
		
	}
}

