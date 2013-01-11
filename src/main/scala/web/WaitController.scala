package web

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation._
import javax.servlet.ServletRequest
import java.util.concurrent.TimeUnit
import java.lang.{Long => JLong}

@Controller
@RequestMapping(Array("/wait"))
class WaitController {

  @RequestMapping
  @ResponseBody
  def list(@RequestParam(required = false) sleep: JLong, request: ServletRequest): String = {
    if (sleep != null) {
      TimeUnit.SECONDS.sleep(sleep)
    }
    "OK: " + request.getServerPort + " " + System.getProperty("PORT") + "\n"
  }

}