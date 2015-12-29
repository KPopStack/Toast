package toast.resolver;

import java.util.Iterator;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class ParamArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer container, NativeWebRequest webRequest,
			WebDataBinderFactory binFactory) throws Exception {
		// TODO Auto-generated method stub
		ParamMap param = new ParamMap();
        for(Iterator<String> iterator = webRequest.getParameterNames(); iterator.hasNext();){
            String key = iterator.next();
            param.put(key, webRequest.getParameter(key));
        }
        return param;
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// TODO Auto-generated method stub
		return ParamMap.class.isAssignableFrom(parameter.getParameterType());
	}

}
