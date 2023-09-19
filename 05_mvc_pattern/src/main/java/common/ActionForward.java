package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data                          // getter&setter&toString등 모두 포함해서 생성하는 lombok
public class ActionForward {
  private String path;         // 어디로 갈 것인가?
  private boolean isRedirect;  // redirect는 true, forward는 false

}
