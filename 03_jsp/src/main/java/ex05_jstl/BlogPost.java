package ex05_jstl;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data                // getter&setter equals&hachCode toString을 모두 한번에 부르는 lombok 어노테이션
public class BlogPost {
  private int blogPostNo;
  private String title;
  private int hit;
  private LocalDate createdAt;
}
