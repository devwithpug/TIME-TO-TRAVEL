package term.project.util;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUtil {

    private static final String IMAGE_DIR = "termproject/resources/img/post";
    private static final int maxPostSize = 5000 * 1024;
    private static final String encoding = "UTF-8";
    private static final FileRenamePolicy policy = new DefaultFileRenamePolicy();


    public static String getImageDir() {
        return IMAGE_DIR;
    }

    public static void deleteFile(HttpServletRequest req, String fileName) {
        new File(req.getSession().getServletContext().getRealPath(IMAGE_DIR) + "/" + fileName).delete();
    }

    public static MultipartRequest multipartRequest(HttpServletRequest req) throws IOException {
        return new MultipartRequest(
                req,
                req.getSession().getServletContext().getRealPath(IMAGE_DIR),
                maxPostSize,
                encoding,
                policy
        );
    }

}
