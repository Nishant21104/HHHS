using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace OCR
{
    public class DocumentVerifier
    {
        private const string UploadFolderPath = "~/Uploads/";

        public bool VerifyNGODocument(string ngodocumentFileName)
        {
            string filePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, UploadFolderPath, ngodocumentFileName);

            // Check if the NGO document file exists
            if (File.Exists(filePath))
            {
                // Implement your verification logic here
                // For example, you can check the file extension or verify the file content

                // For this example, I'm just checking if the file size is greater than 0 bytes
                FileInfo fileInfo = new FileInfo(filePath);
                if (fileInfo.Length > 0)
                {
                    return true;
                }
            }

            return false;
        }

        public bool VerifyFundraiserDocument(string fundraiserDocumentFileName)
        {
            string filePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, UploadFolderPath, fundraiserDocumentFileName);

            // Check if the Fundraiser document file exists
            if (File.Exists(filePath))
            {
                // Implement your verification logic here
                // For example, you can check the file extension or verify the file content

                // For this example, I'm just checking if the file size is greater than 0 bytes
                FileInfo fileInfo = new FileInfo(filePath);
                if (fileInfo.Length > 0)
                {
                    return true;
                }
            }

            return false;
        }
    }
}