package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ActionForward {
  private String path;
  private boolean isRedirect;  // redirect여부를 true/false로 결정

}
